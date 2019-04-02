package com.sonkabin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.sonkabin.dto.RecalculateDTO;
import com.sonkabin.entity.*;
import com.sonkabin.mapper.*;
import com.sonkabin.service.HumanConfigService;
import com.sonkabin.utils.Message;
import com.sonkabin.utils.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@Service
public class HumanConfigServiceImpl implements HumanConfigService {
    @Autowired
    private HumanConfigMapper humanConfigMapper;
    @Autowired
    private ProjectMapper projectMapper;
    @Autowired
    private ProjectHistoryMapper projectHistoryMapper;
    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private SkillMapper skillMapper;

    @Override
    public Message calculateHumans(Integer projectId) {
        Project project = projectMapper.selectById(projectId);

        Map<String, Integer> map = calculateWorkload(project);

        LambdaQueryWrapper<Employee> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Employee::getRoleId, 1); // 筛选角色为员工的employees
        wrapper.eq(Employee::getInservice, 1); // 离职的员工不用考虑
        List<Employee> employees = employeeMapper.selectList(wrapper);
        // 查询员工工作时间比例
        List<Map<String, Object>> humanConf = humanConfigMapper.selectPortion(employees);
        int size = employees.size();
        int[] portions = new int[size];
        Integer[] empIndex = new Integer[size];
        // 初始化portion和员工id索引
        for(int i = 0; i < size; i++) {
            portions[i] = 100;
            empIndex[i] = employees.get(i).getId();
        }

        calculatePortions(humanConf, size, portions, empIndex);

        // 计算每个员工的高于6级的能力：能力等级*工作时间比例
        int[] available = new int[size];
        int[] indexes = new int[size];
        calculateEmployeeWithSort(employees, size, portions, available, indexes);

        List<Employee> candidates = new LinkedList<>();
        List<Integer> candidatePortions = new LinkedList<>();
        calculateCandidates(map, employees, size, portions, indexes, candidates, candidatePortions);
        // 移除候选员工后剩余的员工，因为需要将portions同步更新，需要自己写移除方法
//        employees.removeAll(candidates);
        int j = removeCandidates(employees, portions, candidates);
        int[] empPortions = null;
        if (j > 0) {
            empPortions = new int[j];
            System.arraycopy(portions, 0, empPortions, 0, j);
        }

        return Message.success().put("project", project).put("employees", employees).put("portions", empPortions).put("candidates", candidates).put("candidatePortions",candidatePortions);
    }

    private void calculateEmployeeWithSort(List<Employee> employees, int size, int[] portions, int[] available, int[] indexes) {
        for (int i = 0; i < size; i++) {
            available[i] = 0;
            indexes[i] = i; // 初始化索引
            if (portions[i] > 0) {
                String skills = employees.get(i).getSkills();
                // 新增的员工技能信息未填写完整，可能为null
                if (!StringUtils.isEmpty(skills)) {
                    available[i] = MyUtil.score(skills, portions[i]);
                }
            }
        }

        for (int i = 0; i < size - 1; i++) {
            int maxIndex = i;
            for (int j = i + 1; j < size; j++) {
                if (available[maxIndex] < available[j]) {
                    maxIndex = j;
                }
            }
            int temp = available[i];
            available[i] = available[maxIndex];
            available[maxIndex] = temp;
            // 更新索引
            temp = indexes[i];
            indexes[i] = indexes[maxIndex];
            indexes[maxIndex] = temp;
        }
    }
    private void calculateCandidates(Map<String, Integer> map, List<Employee> employees, int size, int[] portions, int[] indexes, List<Employee> candidates, List<Integer> candidatePortions) {
        int j = 0;
        while (map.size() > 0) {
            if (j == size) { // 防止不能满足条件时出现死循环
                break;
            }
            // 遍历map，移去值小于0的entry
            Iterator<Map.Entry<String, Integer>> iterator = map.entrySet().iterator();
            while (iterator.hasNext()) {
                Map.Entry<String, Integer> entry = iterator.next();
                if (entry.getValue() <= 0) {
                    iterator.remove();
                }
            }
            boolean flag = false;
            // 获取能力最大值的索引
            int index = indexes[j++];
            int portion = portions[index];
            if (portion <= 0) {
                continue; // 工作时间小于等于0的人不用考虑
            }
            String skills = employees.get(index).getSkills();
            String[] skill = skills.split(";");
            for (String s : skill) {
                String[] info = s.split(":");
                String skillName = info[0];
                if (map.containsKey(skillName)) {
                    flag = true;
                    map.put(skillName, map.get(skillName) - (int) (MyUtil.getAbility(info[1]) * portion * 1.0 / 100));
                }
            }
            if (flag) {
                candidates.add(employees.get(index));
                candidatePortions.add(portion);
            }
        }
    }


    /**
     * 计算项目所需的工作量
     * 根据每人的能力和可用时间计算
     * 技能等级 * 比例系数 * 时间百分比
     * 1-1         2-2       3-3
     * 4-4         5-6       6-9
     * 7-14        8-19      9-24
     * 项目肯定是越早完成越好，所以贪心算法是适用的
     * 项目工作量=（预计结束时间-现在时间）* 人数 * 5级技能的能力
     * @return 每项技能所需要的工作量
     */
    private Map<String, Integer> calculateWorkload(Project project) {
        Map<String, Integer> map = new HashMap<>(32);
        String frontEndSkill = project.getFrontEndSkill();
        String[] fess = frontEndSkill.split(",");
        for (String fes : fess) {
            map.put(fes, MyUtil.getAbility("5") * project.getFrontEndNum());
        }
        String backEndSkill = project.getBackEndSkill();
        String[] bess = backEndSkill.split(",");
        for (String bes : bess) {
            map.put(bes, MyUtil.getAbility("5") * project.getBackEndNum());
        }
        String dbSkill = project.getDbSkill();
        String[] dbss = dbSkill.split(",");
        for (String dbs : dbss) {
            map.put(dbs, MyUtil.getAbility("5") * project.getDbNum());
        }
        Employee manager = MyUtil.getSessionEmployee("loginEmp");
        // 移去项目经理的能力值
        String managerSkills = manager.getSkills();
        String[] managerSkill = managerSkills.split(";");
        for (String i : managerSkill) {
            String[] info = i.split(":");
            String skillName = info[0]; // 技能名, info[1]为技能等级
            if (map.containsKey(skillName)) {
                map.put(skillName, map.get(skillName) - (int)(MyUtil.getAbility(info[1]) * 0.4)); // 项目经理还有其他工作，虽然项目上分配了100%的时间，但是实际只有40%时间用于编码工作
            }
        }
        return map;
    }

    // 计算员工剩余工作时间比例
    private void calculatePortions(List<Map<String, Object>> humanConf, int size, int[] portions, Integer[] empIndex) {
        for (Map<String, Object> item : humanConf) {
            Integer empId = (Integer) item.get("empId");
            for (int i = 0; i < size; i++) {
                if (empId.compareTo(empIndex[i]) == 0) {
                    portions[i] =  100 - ((BigDecimal)item.get("empPortion")).intValue();
                }
            }
        }
    }

    @Transactional
    @Override
    public Message startProject(List<HumanConfig> configs) {
        LocalDateTime now = LocalDateTime.now();
        configs.forEach((config) -> {
            config.setStatus(1);
            config.setGmtCreate(now);
            config.setGmtModified(now);
        });
        humanConfigMapper.insertBatch(configs);
        Integer projectId = configs.get(0).getProjectId();
        Project project = new Project();
        project.setId(projectId);
        project.setStatus(1);
        project.setGmtModified(now);
        project.setStartDate(LocalDate.now());
        projectMapper.updateById(project);
        return Message.success();
    }

    @Transactional
    @Override
    public Message saveConfig(List<HumanConfig> configs, LocalDate endDate) {
        LocalDateTime now = LocalDateTime.now();
        configs.forEach((config) -> {
            config.setStatus(1);
            config.setGmtCreate(now);
            config.setGmtModified(now);
        });
        humanConfigMapper.insertBatch(configs);
        Integer projectId = configs.get(0).getProjectId();
        Project project = new Project();
        project.setId(projectId);
        project.setGmtModified(now);
        project.setPredictEnd(endDate);
        projectMapper.updateById(project);
        return Message.success();
    }

    @Override
    public Message getHumanConfigs(Integer projectId) {
        LambdaQueryWrapper<HumanConfig> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(HumanConfig::getProjectId, projectId).eq(HumanConfig::getStatus, 1);
        List<HumanConfig> humanConfigs = humanConfigMapper.selectList(wrapper);
        return Message.success().put("humanConfigs", humanConfigs);
    }

    @Transactional
    @Override
    public Message releaseHuman(HumanConfig config, String contribute) {
        LambdaQueryWrapper<HumanConfig> wrapper = new LambdaQueryWrapper<>();
        Integer projectId = config.getProjectId();
        LocalDateTime now = LocalDateTime.now();
        wrapper.eq(HumanConfig::getProjectId, projectId).eq(HumanConfig::getEmpId, config.getEmpId());
        config.setGmtModified(now);
        config.setStatus(2);
        humanConfigMapper.update(config, wrapper);
        Project project = projectMapper.selectById(projectId);
        ProjectHistory history = new ProjectHistory();
        history.setProjectId(projectId);
        history.setProjectName(project.getProjectName());
        history.setBackground(project.getBackground());
        history.setEmpId(config.getEmpId());
        history.setEmpName(config.getEmpName());
        history.setContribute(contribute);
        history.setManageId(project.getManagerId());
        history.setManageName(project.getManagerName());
        history.setGmtCreate(now);
        history.setGmtModified(now);
        projectHistoryMapper.insert(history);
        return Message.success();
    }

    @Override
    public Message getOtherEmployees(Integer projectId) {
        LambdaQueryWrapper<HumanConfig> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(HumanConfig::getProjectId, projectId).eq(HumanConfig::getStatus, 1);
        // 项目当前的人员配置
        List<HumanConfig> humanConfigs = humanConfigMapper.selectList(wrapper);
        LambdaQueryWrapper<Employee> employeeLambdaQueryWrapper = new LambdaQueryWrapper<>();
        employeeLambdaQueryWrapper.eq(Employee::getRoleId, 1); // 筛选角色为员工的employees
        employeeLambdaQueryWrapper.eq(Employee::getInservice, 1); // 离职的员工不用考虑
        List<Employee> employees = employeeMapper.selectList(employeeLambdaQueryWrapper);
        // 移除当前项目的人员
        removeCurrentEmployees(humanConfigs, employees);

        // 查询员工工作时间比例
        List<Map<String, Object>> humanConf = humanConfigMapper.selectPortion(employees);
        int size = employees.size();
        int[] portions = new int[size];
        Integer[] empIndex = new Integer[size];
        // 初始化portion和员工id索引
        for(int i = 0; i < size; i++) {
            portions[i] = 100;
            empIndex[i] = employees.get(i).getId();
        }
        // 计算员工剩余工作时间比例
        calculatePortions(humanConf, size, portions, empIndex);
        // 移除剩余工作时间比例小于等于0的员工
        Iterator<Employee> iterator = employees.iterator();
        int[] copy = new int[size];
        System.arraycopy(portions, 0, copy, 0, size);
        int j=0, k=0;
        while (iterator.hasNext()) {
            iterator.next();
            int temp = copy[k++];
            if (temp <= 0) {
                iterator.remove();
            } else {
                portions[j++] = temp;
            }
        }

        int[] empPortions = null;
        if (j > 0) {
            empPortions = new int[j];
            System.arraycopy(portions, 0, empPortions, 0, j);
        }

        return Message.success().put("employees", employees).put("portions", empPortions);
    }

    /**
     * 移除当前项目的人员
     */
    private void removeCurrentEmployees(List<HumanConfig> humanConfigs, List<Employee> employees) {
        List<HumanConfig> copy = new LinkedList<>(humanConfigs);
        Iterator<Employee> iterator = employees.iterator();
        while (iterator.hasNext()) {
            Employee employee = iterator.next();
            Iterator<HumanConfig> humanConfigIterator = copy.iterator();
            while (humanConfigIterator.hasNext()) {
                HumanConfig humanConfig = humanConfigIterator.next();
                if (humanConfig.getEmpId().compareTo(employee.getId()) == 0) {
                    iterator.remove();
                    humanConfigIterator.remove();
                    break;
                }
            }
        }
    }

    @Override
    public Message requireHuman(List<HumanConfig> configs) {
        LocalDateTime now = LocalDateTime.now();
        configs.forEach((config) -> {
            config.setStatus(1);
            config.setGmtCreate(now);
            config.setGmtModified(now);
        });
        humanConfigMapper.insertBatch(configs);
        return Message.success();
    }

    /*
    当某一端人员不足时，不会自动解决
     */
    @Override
    public Message recalculate(RecalculateDTO recalculateDTO) {
        Integer projectId = recalculateDTO.getProjectId();
        Project project = projectMapper.selectById(projectId);
        // 计算项目工作量
        Map<String, Integer> map = calculateWorkload(project);

        LambdaQueryWrapper<HumanConfig> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(HumanConfig::getProjectId, projectId).eq(HumanConfig::getStatus, 1);
        // 当前项目的人员配置
        List<HumanConfig> humanConfigs = humanConfigMapper.selectList(wrapper);
        LambdaQueryWrapper<Employee> employeeLambdaQueryWrapper = new LambdaQueryWrapper<>();
        employeeLambdaQueryWrapper.eq(Employee::getRoleId, 1); // 筛选角色为员工的employees
        employeeLambdaQueryWrapper.eq(Employee::getStatus, 1); // 禁用的员工不用考虑
        List<Employee> employees = employeeMapper.selectList(employeeLambdaQueryWrapper);
        // 移除当前项目的人员
        removeCurrentEmployees(humanConfigs, employees);

        // 查询员工工作时间比例
        List<Map<String, Object>> humanConf = humanConfigMapper.selectPortion(employees);
        int size = employees.size();
        int[] portions = new int[size];
        Integer[] empIndex = new Integer[size];
        // 初始化portion和员工id索引
        for(int i = 0; i < size; i++) {
            portions[i] = 100;
            empIndex[i] = employees.get(i).getId();
        }
        // 计算员工剩余工作时间比例
        calculatePortions(humanConf, size, portions, empIndex);

        // 计算每个员工的高于6级的能力：能力等级*工作时间比例
        int[] available = new int[size];
        int[] indexes = new int[size];
        calculateEmployeeWithSort(employees, size, portions, available, indexes);

        // 两个日期之间间隔天数
        LocalDate predictEnd = project.getPredictEnd();
        LocalDate endDate = recalculateDTO.getEndDate();
        long minus = predictEnd.toEpochDay() - endDate.toEpochDay();
        // 以每提前一个10天为项目增加一个前台人员和后台人员
        int num = 0, frontNum = 0, backNum = 0;
        num += minus / 10;
        num *= 2;
        // 计算候选人员
        List<Employee> candidates = new LinkedList<>();
        List<Integer> candidatePortions = new LinkedList<>();
        LambdaQueryWrapper<Skill> skillLambdaQueryWrapper = new LambdaQueryWrapper<>();
        skillLambdaQueryWrapper.eq(Skill::getDomain, "前端");
        List<Skill> frontEndSkills = skillMapper.selectList(skillLambdaQueryWrapper);
        skillLambdaQueryWrapper = new LambdaQueryWrapper<>();
        skillLambdaQueryWrapper.eq(Skill::getDomain, "后端");
        List<Skill> backEndSkills = skillMapper.selectList(skillLambdaQueryWrapper);
        for (int i = 0; i < size; i++) {
            if (frontNum + backNum == num) { // 优化
                break;
            }
            int frontCount = 0;
            int backCount = 0;
            int index = indexes[i];
            int portion = portions[index];
            if (portion <= 0) {
                continue; // 工作时间小于等于0的人不用考虑
            }
            String skills = employees.get(index).getSkills();
            for (Skill each : frontEndSkills) {
                if (skills.contains(each.getSkillName())) {
                    frontCount++;
                }
            }
            for (Skill each : backEndSkills) {
                if (skills.contains(each.getSkillName())) {
                    backCount++;
                }
            }
            if (frontNum != num /2 && frontCount > backCount) { // 是前端人员
                frontNum++;
                candidates.add(employees.get(index));
                candidatePortions.add(portion);
            } else if (backNum != num /2 && frontCount <= backCount){ // 后端人员
                backNum++;
                candidates.add(employees.get(index));
                candidatePortions.add(portion);
            }

        }
        // 移除候选员工后剩余的员工
        int j = removeCandidates(employees, portions, candidates);
        int[] empPortions = null;
        if (j > 0) {
            empPortions = new int[j];
            System.arraycopy(portions, 0, empPortions, 0, j);
        }

        return Message.success().put("employees", employees).put("empPortions", empPortions)
                .put("candidates", candidates).put("candidatePortions", candidatePortions);
    }

    private int removeCandidates(List<Employee> employees, int[] portions, List<Employee> candidates) {
        Iterator<Employee> iterator = employees.iterator();
        // 若员工需要全部加入到候选者中，直接返回
        if (employees.size() == candidates.size()) {
            return -1;
        }
        int len = portions.length;
        int[] copy = new int[len];
        System.arraycopy(portions, 0, copy, 0, len);
        int j = 0, k = 0;
        while (iterator.hasNext()) {
            int temp = copy[k++];
            // 若候选人中包含员工或者工作时间比例小于等于0，需移除
            if (candidates.contains(iterator.next()) || temp <= 0) {
                iterator.remove();
            } else {
                portions[j++] = temp;
            }
        }
        return j;
    }

}
