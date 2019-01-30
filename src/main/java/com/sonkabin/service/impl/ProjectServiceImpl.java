package com.sonkabin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sonkabin.dto.ProjectDTO;
import com.sonkabin.entity.Employee;
import com.sonkabin.entity.Project;
import com.sonkabin.entity.ProjectHistory;
import com.sonkabin.mapper.EmployeeMapper;
import com.sonkabin.mapper.HumanConfigMapper;
import com.sonkabin.mapper.ProjectHistoryMapper;
import com.sonkabin.mapper.ProjectMapper;
import com.sonkabin.service.ProjectService;
import com.sonkabin.utils.Message;
import com.sonkabin.utils.MyUtil;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
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
public class ProjectServiceImpl implements ProjectService {
    @Autowired
    private ProjectMapper projectMapper;
    @Autowired
    private ProjectHistoryMapper projectHistoryMapper;
    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private HumanConfigMapper humanConfigMapper;

    @Override
    public Message getProjects(ProjectDTO projectDTO) {
        Page<Project> page = new Page<>();
        page.setSize(projectDTO.getRows());
        page.setCurrent(projectDTO.getPage());
        LambdaQueryWrapper<Project> wrapper = new LambdaQueryWrapper<>();
        if (projectDTO.getStatus() != -1) {
            wrapper.eq(Project::getStatus, projectDTO.getStatus());
        }
        Employee employee = (Employee) SecurityUtils.getSubject().getSession().getAttribute("loginEmp");
        // 获取某个项目经理的项目，而不是所有项目
        wrapper.eq(Project::getManagerId, employee.getId());
        IPage<Project> result = projectMapper.selectPage(page, wrapper);
        Message msg = Message.success().put("total", result.getTotal());
        msg.put("rows", result.getRecords());
        return msg;
    }

    @Override
    public Message saveProject(Project project) {
        project.setStatus(0);
        project.setGmtCreate(LocalDateTime.now());
        project.setGmtModified(LocalDateTime.now());
        Employee employee = MyUtil.getSessionEmployee("loginEmp");
        project.setManagerId(employee.getId());
        projectMapper.insert(project);
        return Message.success();
    }

    @Override
    public Message getHumanDetailByProjectId(Integer id) {
        Project project = projectMapper.selectById(id);
        LambdaQueryWrapper<ProjectHistory> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(ProjectHistory::getProjectId, id);
        List<ProjectHistory> histories = projectHistoryMapper.selectList(wrapper);
        return Message.success().put("project", project).put("humans", histories);
    }

    @Override
    public Message calculateHumans(Integer projectId) {
        /*
        根据每人的能力和可用时间计算
        技能等级 * 比例系数 * 时间百分比
        1-1         2-2       3-3
        4-4         5-6       6-9
        7-14        8-19      9-24
        项目肯定是越早完成越好，所以贪心算法是适用的
        项目工作量=（预计结束时间-现在时间）* 人数 * 5级技能的能力
        <=某人此能力*百分比+~+~
         */
        Project project = projectMapper.selectById(projectId);
        // 计算项目所需的能力
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

        LambdaQueryWrapper<Employee> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Employee::getRoleId, 1); // 筛选角色为员工的employees
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
        // 计算员工剩余工作时间比例
        for (Map<String, Object> item : humanConf) {
            Integer empId = (Integer) item.get("empId");
            for (int i = 0; i < size; i++) {
                if (empId.compareTo(empIndex[i]) == 0) {
                    portions[i] =  100 - ((BigDecimal)item.get("empPortion")).intValue();
                }
            }
        }

        // 计算每个员工的高于6级的能力：能力等级*工作时间比例
        int[] available = new int[size];
        int[] indexes = new int[size];
        for (int i = 0; i < size; i++) {
            available[i] = 0;
            indexes[i] = i; // 初始化索引
            String skills = employees.get(i).getSkills();
            // 新增的员工技能信息未填写完整，可能为null
            if (!StringUtils.isEmpty(skills)) {
                available[i] = MyUtil.score(skills, portions[i]);
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

        List<Employee> candidates = new LinkedList<>();
        List<Integer> candidatePortions = new LinkedList<>();
        int j = 0;
        while (map.size() > 0) {
            if (j == size) { // 防止不能满足条件时出现死循环
                break;
            }
            boolean flag = false;
            int index = indexes[j++];
            int portion = portions[index];
            String skills = employees.get(index).getSkills();
            String[] skill = skills.split(";");
            for (String s : skill) {
                String[] info = s.split(":");
                String skillName = info[0];
                if (map.containsKey(skillName)) {
                    flag = true;
                    map.put(skillName,map.get(skillName) - (int)(MyUtil.getAbility(info[1]) * portion * 1.0 / 100));
                }
            }
            if (flag) {
                candidates.add(employees.get(index));
                candidatePortions.add(portion);
            }
            // 遍历map，移去值小于0的entry
            Iterator<Map.Entry<String, Integer>> iterator = map.entrySet().iterator();
            while (iterator.hasNext()) {
                Map.Entry<String, Integer> entry = iterator.next();
                if (entry.getValue() <= 0) {
                    iterator.remove();
                }
            }
        }
        // 移除候选员工后剩余的员工
        employees.removeAll(candidates);
        return Message.success().put("project", project).put("employees", employees).put("candidates", candidates).put("candidatePortions",candidatePortions);
    }
}
