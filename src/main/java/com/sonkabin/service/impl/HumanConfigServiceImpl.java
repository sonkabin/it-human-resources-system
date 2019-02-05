package com.sonkabin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.sonkabin.entity.Employee;
import com.sonkabin.entity.HumanConfig;
import com.sonkabin.entity.Project;
import com.sonkabin.entity.ProjectHistory;
import com.sonkabin.mapper.EmployeeMapper;
import com.sonkabin.mapper.HumanConfigMapper;
import com.sonkabin.mapper.ProjectHistoryMapper;
import com.sonkabin.mapper.ProjectMapper;
import com.sonkabin.service.HumanConfigService;
import com.sonkabin.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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

    @Transactional
    @Override
    public Message saveConfig(List<HumanConfig> configs) {
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
        // 当前项目的人员配置
        List<HumanConfig> humanConfigs = humanConfigMapper.selectList(wrapper);
        LambdaQueryWrapper<Employee> employeeLambdaQueryWrapper = new LambdaQueryWrapper<>();
        employeeLambdaQueryWrapper.eq(Employee::getRoleId, 1); // 筛选角色为员工的employees
        employeeLambdaQueryWrapper.eq(Employee::getStatus, 1); // 禁用的员工不用考虑
        List<Employee> employees = employeeMapper.selectList(employeeLambdaQueryWrapper);
        // 移除当前项目的人员
        Iterator<Employee> iterator = employees.iterator();
        while (iterator.hasNext()) {
            Employee next = iterator.next();
            Iterator<HumanConfig> humanConfigIterator = humanConfigs.iterator();
            while (humanConfigIterator.hasNext()) {
                if (humanConfigIterator.next().getEmpId() == next.getId()) {
                    iterator.remove();
                    humanConfigIterator.remove();
                    break;
                }
            }
        }
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
                    portions[i] = 100 - ((BigDecimal)item.get("empPortion")).intValue();
                }
            }
        }
        // 移除剩余工作时间比例小于等于0的员工
        int j = 0;
        iterator = employees.iterator();
        while (iterator.hasNext()) {
            iterator.next();
            if (portions[j] <= 0) {
                iterator.remove();
                portions[j] = portions[j + 1];
            } else {
                j++;
            }
        }
        int[] empPortions = new int[j];
        System.arraycopy(portions, 0, empPortions, 0, j);

        return Message.success().put("employees", employees).put("portions", empPortions);
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
}
