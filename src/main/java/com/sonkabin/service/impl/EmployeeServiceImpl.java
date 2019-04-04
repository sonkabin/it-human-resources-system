package com.sonkabin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sonkabin.dto.EmployeeDTO;
import com.sonkabin.entity.Employee;
import com.sonkabin.entity.Role;
import com.sonkabin.mapper.EmployeeMapper;
import com.sonkabin.mapper.RoleMapper;
import com.sonkabin.service.EmployeeService;
import com.sonkabin.utils.MD5Util;
import com.sonkabin.utils.Message;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-13
 */
@Transactional(readOnly = true)
@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private RoleMapper roleMapper;


    @Override
    public Employee selectOne(String empId, String pwd) {
        LambdaQueryWrapper<Employee> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Employee::getEmpId, empId).eq(Employee::getPassword, pwd).eq(Employee::getStatus, 1);
        return employeeMapper.selectOne(wrapper);
    }

    @Override
    public void login(String empId, String password) {
        Subject currentUser = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(empId, password);
        currentUser.login(token);
    }

    public Message getEmps(EmployeeDTO employeeDTO) {
        // 分页设置
        Page<Employee> page = new Page<>();
        page.setSize(employeeDTO.getRows());
        page.setCurrent(employeeDTO.getPage());
        if (!StringUtils.isEmpty(employeeDTO.getSort())) {
            if (employeeDTO.getSortOrder().equalsIgnoreCase("asc")) {
                page.setAsc(employeeDTO.getSort());
            } else {
                page.setDesc(employeeDTO.getSort());
            }
        }
        // 模糊查询
        LambdaQueryWrapper<Employee> wrapper = new LambdaQueryWrapper<>();
        if (!StringUtils.isEmpty(employeeDTO.getEmpId())) {
            wrapper.like(Employee::getEmpId, employeeDTO.getEmpId());
        }
        if (!StringUtils.isEmpty(employeeDTO.getEmpName())) {
            wrapper.like(Employee::getEmpName, employeeDTO.getEmpName());
        }
        IPage<Employee> result = employeeMapper.selectPage(page, wrapper);
        Message msg = Message.success().put("total", result.getTotal());
        msg.put("rows", result.getRecords());
        return msg;
    }

    @Override
    public Message setPassword(Integer id, String oldPwd, String newPwd) {
        Employee employee = employeeMapper.selectById(id);
        String pwd;
        if (oldPwd == null) { // 为null表示是重置密码
            pwd = MD5Util.calculatePwd("123456", employee.getEmpId());
        } else {
            // 计算旧密码的值
            String password = MD5Util.calculatePwd(oldPwd, employee.getEmpId());
            if (password.equals(employee.getPassword())) { // 计算值与数据库一致
                pwd = MD5Util.calculatePwd(newPwd, employee.getEmpId()); // 设为新密码
            } else { // 计算值不一致，直接返回
                return Message.fail().put("msg", "原密码输入错误");
            }
        }
        employee.setPassword(pwd);
        employee.setGmtModified(LocalDateTime.now());
        employeeMapper.updateById(employee);
        return Message.success();
    }

    @Override
    public Message saveEmployee(Employee employee) {
        LocalDateTime now = LocalDateTime.now();
        employee.setGmtCreate(now);
        employee.setGmtModified(now);
        // 计算年龄
        LocalDate birth = employee.getBirth();
        int age = now.getYear() - birth.getYear() + 1;
        employee.setAge(age);
        // 计算密码
        String pwd = MD5Util.calculatePwd("123456", employee.getEmpId());
        employee.setPassword(pwd);
        employeeMapper.insert(employee);
        return Message.success();
    }

    @Override
    public Message getEmpById(Integer id) {
        Employee employee = employeeMapper.selectById(id);
        return Message.success().put("employee", employee);
    }

    @Override
    public Message getEmpWithRoleById(Integer id) {
        Employee employee = employeeMapper.getEmpWithRoleById(id);
        List<Role> roles = roleMapper.selectList(null);
        return Message.success().put("employee", employee).put("roles", roles);
    }

    @Override
    public Message updateEmployee(Employee employee) {
        if (employee.getBirth() != null) {
            employee.setAge(LocalDate.now().getYear() - employee.getBirth().getYear() + 1);
        }
        employee.setGmtModified(LocalDateTime.now());
        employeeMapper.updateById(employee);
        return Message.success();
    }

    @Override
    public Message getEmployeeSkills(Integer id) {
        Employee employee = employeeMapper.selectSkill(id);
        return Message.success().put("employee", employee);
    }

    @Override
    public Message getNotInserviceEmployee() {
        LambdaQueryWrapper<Employee> wrapper = new LambdaQueryWrapper<>();
        List<Map<String, Object>> data = new ArrayList<>();
        wrapper.eq(Employee::getInservice, 0);
        List<Employee> employees = employeeMapper.selectList(wrapper); // 离职人员
        if (employees.size() > 0) {
            data = employeeMapper.getProjects(employees);
        }
        return Message.success().put("total", data.size()).put("rows", data);
    }

}
