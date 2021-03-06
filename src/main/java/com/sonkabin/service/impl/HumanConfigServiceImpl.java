package com.sonkabin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.sonkabin.dto.RecalculateDTO;
import com.sonkabin.entity.*;
import com.sonkabin.mapper.*;
import com.sonkabin.service.HumanConfigService;
import com.sonkabin.utils.Message;
import com.sonkabin.utils.MessageUtil;
import com.sonkabin.utils.MyConstant;
import com.sonkabin.utils.MyUtil;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

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
        int size = employees.size();
        int[] portions = new int[size];
        Integer[] empIndex = new Integer[size];
        // 初始化portion和员工id索引
        for(int i = 0; i < size; i++) {
            portions[i] = 100;
            empIndex[i] = employees.get(i).getId();
        }
        // 查询员工当前工作时间比例
        List<Map<String, Object>> humanConf = humanConfigMapper.selectPortion(employees);

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
        // 计算前端所需技能的工作量
        String frontEndSkill = project.getFrontEndSkill();
        String[] fess = frontEndSkill.split(","); // 将每个技能存到数组中
        for (String fes : fess) {
            map.put(fes, MyUtil.getAbility("5") * project.getFrontEndNum());
        }
        // 计算后端所需技能的工作量
        String backEndSkill = project.getBackEndSkill();
        String[] bess = backEndSkill.split(",");
        for (String bes : bess) {
            map.put(bes, MyUtil.getAbility("5") * project.getBackEndNum());
        }
        // 计算数据库所需技能的工作量
        String dbSkill = project.getDbSkill();
        String[] dbss = dbSkill.split(",");
        for (String dbs : dbss) {
            map.put(dbs, MyUtil.getAbility("5") * project.getDbNum());
        }
        // 移去项目经理的能力值
        Employee manager = MyUtil.getSessionEmployee("loginEmp"); // 获得登录用户，即当前在操作的项目经理
        String managerSkills = manager.getSkills();
        String[] managerSkill = managerSkills.split(";");
        for (String i : managerSkill) {
            String[] info = i.split(":");
            String skillName = info[0]; // 技能名, info[1]为技能等级
            if (map.containsKey(skillName)) { //
                // 项目经理规则：项目经理还有其他工作，虽然项目上分配了100%的时间，但是实际只有40%时间用于编码工作
                map.put(skillName, map.get(skillName) - (int)(MyUtil.getAbility(info[1]) * 0.4));
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

    private void calculateEmployeeWithSort(List<Employee> employees, int size, int[] portions, int[] available, int[] indexes) {
        Map<Integer, Double> evaluationMap = calEmployeeEvaluation();
        for (int i = 0; i < size; i++) {
            available[i] = 0;
            indexes[i] = i; // 初始化索引
            if (portions[i] > 0) {
                Employee employee = employees.get(i);
                String skills = employee.getSkills();
                // 新增的员工技能信息未填写，则可能为null
                if (!StringUtils.isEmpty(skills)) {
                    Double evaluation = evaluationMap.get(employee.getId()); // 员工评价，比evaluation例为0.8-1.2浮动
                    if (evaluation == null) { // 若没有任何评价，表示还未参与过项目，因此比例设为1.0
                        evaluation = 1.0;
                    }
                    available[i] = (int) (MyUtil.score(skills, portions[i]) * evaluation);
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

    @Autowired
    private EmployeeEvaluationMapper employeeEvaluationMapper;
    private Map<Integer, Double> calEmployeeEvaluation() {
        Map<Integer, Double> evaluation = new HashMap<>();
        List<Map<String, Object>> statistics = employeeEvaluationMapper.selectStatistics();
        statistics.forEach(e -> {
            double employeeScores = 10.0;
            double managerScore = 10.0;
            Integer empId = (Integer) e.get("empId");
            BigDecimal employeeSc = (BigDecimal) e.get("employeeSc");
            BigDecimal managerSc = (BigDecimal) e.get("managerSc");
            if (employeeSc != null) {
                employeeScores = employeeSc.doubleValue();
            }
            if (managerSc != null) {
                managerScore = managerSc.doubleValue();
            }
            evaluation.put(empId, (employeeScores*0.4 + managerScore*0.6) * 1.0 / 10);
        });
        return evaluation;
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

    @Autowired
    private MessageMapper messageMapper;
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
        Project project = projectMapper.selectById(projectId);
        project.setStatus(1);
        project.setGmtModified(now);
        project.setStartDate(now.toLocalDate());
        projectMapper.updateById(project);
        // 发送消息给员工
        String msg = MessageUtil.joinProject(project.getProjectName(), project.getManagerName());
        configs.stream().filter(e -> e.getEmpId().compareTo(project.getManagerId()) != 0).forEach(e -> {
            com.sonkabin.entity.Message message = new com.sonkabin.entity.Message();
            message.setContent(msg);
            message.setStatus(0);
            message.setGmtCreate(now);
            message.setGmtModified(now);
            message.setSender("系统");
            message.setReceiverId(e.getEmpId());
            message.setReceiverName(e.getEmpName());
            messageMapper.insert(message);
        });
        // 插入员工评价表，项目经理不需要
        List<HumanConfig> collect = configs.stream().filter(e -> e.getEmpId().compareTo(project.getManagerId()) != 0).collect(Collectors.toList());
        employeeEvaluationMapper.insertBatch(collect, projectId);
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
            config.setApplyReason(MyConstant.SPEED_PROJECT_APPLY_REASON);
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
    public Message getHumanConfigs(Integer projectId, boolean flag) {
        LambdaQueryWrapper<HumanConfig> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(HumanConfig::getProjectId, projectId).eq(flag, HumanConfig::getStatus, 1);
        List<HumanConfig> humanConfigs = humanConfigMapper.selectList(wrapper);
        return Message.success().put("humanConfigs", humanConfigs);
    }

    @Autowired
    private RabbitTemplate rabbitTemplate;
    @Autowired
    private DirectExchange directExchange;
    @Transactional
    @Override
    public Message releaseHuman(HumanConfig config, String contribute) {
        // 1. 更新人力资源配置表
        LambdaQueryWrapper<HumanConfig> wrapper = new LambdaQueryWrapper<>();
        Integer projectId = config.getProjectId();
        LocalDateTime now = LocalDateTime.now();
        wrapper.eq(HumanConfig::getProjectId, projectId).eq(HumanConfig::getEmpId, config.getEmpId());
        config.setGmtModified(now);
        config.setStatus(2);
        humanConfigMapper.update(config, wrapper);
        // 2. 项目参与历史中插入一条记录
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
        // 3. 发送封装好的消息到消息队列，由工作进程处理
        StringBuffer buffer = new StringBuffer(project.getFrontEndSkill());
        buffer.append(",");
        buffer.append(project.getBackEndSkill());
        buffer.append(",");
        buffer.append(project.getDbSkill());
        Map<String, Object> msg = new HashMap<>();
        msg.put("skills", buffer.toString());
        msg.put("empId", config.getEmpId());
        rabbitTemplate.convertAndSend(directExchange.getName(), "proficiency.update", msg);
        return Message.success();
    }

    @Override
    public Message getOtherEmployees(Integer projectId) {
        // 项目当前的人员配置，包括已释放成员，因为已释放成员不允许再加入项目中
        LambdaQueryWrapper<HumanConfig> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(HumanConfig::getProjectId, projectId);
        List<HumanConfig> humanConfigs = humanConfigMapper.selectList(wrapper);
        // 所有普通员工
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

    @Transactional
    @Override
    public Message requireHuman(List<HumanConfig> configs) {
        LocalDateTime now = LocalDateTime.now();
        configs.forEach((config) -> {
            config.setStatus(1);
            config.setGmtCreate(now);
            config.setGmtModified(now);
        });
        humanConfigMapper.insertBatch(configs);
        Integer projectId = configs.get(0).getProjectId();
        employeeEvaluationMapper.insertBatch(configs, projectId);
        return Message.success();
    }

    /*
    当某一端人员不足时，将会发送系统通知消息给管理员
     */
    @Override
    public Message recalculate(RecalculateDTO recalculateDTO) {
        Integer projectId = recalculateDTO.getProjectId();
        Project project = projectMapper.selectById(projectId);
        // 计算项目工作量
        Map<String, Integer> map = calculateWorkload(project);

        LambdaQueryWrapper<HumanConfig> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(HumanConfig::getProjectId, projectId);
        List<HumanConfig> humanConfigs = humanConfigMapper.selectList(wrapper);// 当前项目的人员配置，已被释放的成员将不会再考虑进项目组

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

        // 计算每个员工的高于6级的能力：能力等级*工作时间比例
        int[] available = new int[size];
        int[] indexes = new int[size];
        calculateEmployeeWithSort(employees, size, portions, available, indexes);

        // 两个日期之间间隔天数
        LocalDate predictEnd = project.getPredictEnd();
        LocalDate endDate = recalculateDTO.getEndDate();
        long minus = predictEnd.toEpochDay() - endDate.toEpochDay();
        // 以每提前一个10天为项目增加一个前台人员和后台人员
        // frontNum：要加入的前端人员数， backNum：要加入的后端人员数
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
            if (frontNum != num /2 && frontCount > backCount) { // 前端人员数未达到所要求的数量，且当前人员是前端人员
                frontNum++;
                candidates.add(employees.get(index));
                candidatePortions.add(portion);
            } else if (backNum != num /2 && frontCount <= backCount){ // 后端人员数未达到所要求的数量，且当前人员后端人员
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

        // 检查此项目中员工的需求是否足够，若缺少员工，则发送系统通知给管理员
        checkEmployeeNum(num/2, frontNum, backNum);

        return Message.success().put("employees", employees).put("empPortions", empPortions)
                .put("candidates", candidates).put("candidatePortions", candidatePortions);
    }

    private void checkEmployeeNum(int num, int frontNum, int backNum) {
        List<com.sonkabin.entity.Message> messages = null;
        if (num > frontNum && num > backNum) {
            messages = MessageUtil.employeeNotEnoughMessage(2, num - frontNum, num - backNum);
        } else if (num > frontNum) {
            messages = MessageUtil.employeeNotEnoughMessage(0, num - frontNum, 0);
        } else if (num > backNum) {
            messages = MessageUtil.employeeNotEnoughMessage(1, 0, num - backNum);
        }
        if (messages != null) {
            messages.forEach((message) -> {
                messageMapper.insert(message);
            });
        }
    }


    @Override
    public Message getInvolveProjects(Integer empId) {
        LambdaQueryWrapper<HumanConfig> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(HumanConfig::getEmpId, empId).and(i -> i.eq(HumanConfig::getStatus, 1));
        List<HumanConfig> humanConfigs = humanConfigMapper.selectList(wrapper);
        List<Project> projects = new ArrayList<>();
        // 员工有参与项目
        if (humanConfigs.size() > 0) {
            // 根据项目id查询对应的项目
            List<Integer> temp = new ArrayList<>();
            humanConfigs.forEach(e -> temp.add(e.getProjectId()));
            LambdaQueryWrapper<Project> projectLambdaQueryWrapper = new LambdaQueryWrapper<>();
            projectLambdaQueryWrapper.in(Project::getId, temp);
            projects = projectMapper.selectList(projectLambdaQueryWrapper);
        }
        return Message.success().put("config", humanConfigs).put("projects", projects);
    }

    @Override
    public Set<HumanConfig> getAlterationHumanConfigRecords(Integer projectId) {
        LambdaQueryWrapper<HumanConfig> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(HumanConfig::getProjectId, projectId);
        List<HumanConfig> alterations = humanConfigMapper.selectList(wrapper);
        Set<HumanConfig> result = new HashSet<>();
        alterations.stream().filter(hc -> !StringUtils.isEmpty(hc.getApplyReason())).forEach(result::add);
        alterations.stream().filter(hc -> !StringUtils.isEmpty(hc.getReleaseReason())).forEach(result::add);
        return result;
    }

}
