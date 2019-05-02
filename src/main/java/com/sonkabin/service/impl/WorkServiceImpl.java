package com.sonkabin.service.impl;

import com.sonkabin.entity.Employee;
import com.sonkabin.entity.SkillProficiency;
import com.sonkabin.mapper.EmployeeMapper;
import com.sonkabin.mapper.SkillProficiencyMapper;
import com.sonkabin.service.WorkService;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.LinkedHashMap;
import java.util.Map;

@Service
public class WorkServiceImpl implements WorkService {

    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private SkillProficiencyMapper skillProficiencyMapper;

    @RabbitListener(queues = "it-human-resources-queue")
    @Override
    public void receiveSkillDevelopmentMessage(Map<String, Object> map) {
        String projectSkills = (String) map.get("skills"); // 所有技能以逗号分隔
        Integer empId = (Integer) map.get("empId"); // 此empId为id的别名
        // 若员工没有技能信息，是不可能参与到项目中的，故employeeSkills必不为null
        Employee employee = employeeMapper.selectSkill(empId);
        // 将员工技能封装为map
        Map<String, Integer> employeeSkillMap = new LinkedHashMap<>();
        encapsulationSkillToMap(employeeSkillMap, employee.getSkills());

        SkillProficiency sp = skillProficiencyMapper.selectByEmpId(empId);
        Map<String, Integer> skillProficiencyMap = new LinkedHashMap<>();
        // 员工技能熟练度可能没有记录，需要考虑null的情况
        if (sp == null) {
            sp = new SkillProficiency();
            employeeSkillMap.forEach((skillName, level) -> skillProficiencyMap.put(skillName, 0));
        } else {
            String proficiency = sp.getProficiency();
            encapsulationSkillToMap(skillProficiencyMap, proficiency);
        }
        // 检查员工的技能map和熟练度map是否相等，若不等，说明员工添加了新的技能
        if (employeeSkillMap.size() != skillProficiencyMap.size()) {
            employeeSkillMap.forEach((skillName, level) -> {
                if (!skillProficiencyMap.containsKey(skillName)) {
                    skillProficiencyMap.put(skillName, 0);
                }
            });
        }
        // 好的，现在我们得到了员工的技能map和熟练度map，可进入下一步
        for (String skillName : projectSkills.split(",")) {
            if (skillProficiencyMap.containsKey(skillName)) {
                skillProficiencyMap.put(skillName, skillProficiencyMap.get(skillName) + 1);
            }
        }
        // 根据熟练度更新技能map和熟练度map
        for (String skillName : skillProficiencyMap.keySet()) {
            Integer proficiency = skillProficiencyMap.get(skillName);
            Integer level = employeeSkillMap.get(skillName);
            Integer improveSkillLevel = improveSkill(level, proficiency);
            // 若当前技能等级发生变化，说明技能等级提高了，更新技能map和熟练度map
            if (level.compareTo(improveSkillLevel) != 0) {
                employeeSkillMap.put(skillName, improveSkillLevel);
                skillProficiencyMap.put(skillName, 0);
            }
        }
        // 将技能和熟练度封装成数据库存储的格式
        String employeeSkills = encapsulationMapToSkill(employeeSkillMap);
        String proficiency = encapsulationMapToSkill(skillProficiencyMap);
        employee.setSkills(employeeSkills);
        employeeMapper.updateById(employee);

        LocalDateTime now = LocalDateTime.now();
        sp.setProficiency(proficiency);
        sp.setGmtModified(now);
        if (sp.getEmpId() == null) {
            sp.setGmtCreate(now);
            sp.setEmpId(empId);
            skillProficiencyMapper.insert(sp);
        } else {
            skillProficiencyMapper.updateByEmpId(sp);
        }
        // 测试是否是后台运行的。
        // 测试成功，是后台运行的，不会使前台http请求长时间等待
//        try {
//            Thread.sleep(2000);
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
    }

    private void encapsulationSkillToMap(Map<String, Integer> skillMap, String skillInfo) {
        for (String skillLevel : skillInfo.split(";")) {
            String[] strings = skillLevel.split(":");
            skillMap.put(strings[0], Integer.parseInt(strings[1]));
        }
    }

    /**
     * 根据当前技能等级和熟练度计算技能等级
     * 技能升级情况：
     *      x < 4时，当proficiency=1，则x=4
     * 4 <= x < 6时，当proficiency=1，则x=x+1
     * x = 6，7，8时，当proficiency=2，则x=x+1
     * @param skillLevel：当前技能等级
     * @param proficiency：熟练度数值
     * @return：技能等级
     */
    private Integer improveSkill(Integer skillLevel, Integer proficiency) {
        // 熟练度为0，项目中没有用到此技能；9级技能不再升级
        if (proficiency == 0 || skillLevel == 9) {
            return skillLevel;
        }
        // 显然此时proficiency至少为1
        if (skillLevel < 4) {
            return 4;
        } else if (skillLevel < 6 || proficiency == 2) {
            return skillLevel + 1;
        }
        return skillLevel;
    }

    private String encapsulationMapToSkill(Map<String, Integer> skillMap) {
        StringBuilder builder = new StringBuilder();
        skillMap.forEach((skillName, level) -> {
            builder.append(skillName);
            builder.append(":");
            builder.append(level);
            builder.append(";");
        });
        builder.deleteCharAt(builder.length() - 1); // 移除最后一个分号
        return builder.toString();
    }
}
