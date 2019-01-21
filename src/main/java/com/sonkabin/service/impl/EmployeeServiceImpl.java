package com.sonkabin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sonkabin.dto.EmployeeDTO;
import com.sonkabin.entity.Employee;
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
        wrapper.eq(Employee::getEmpId, empId).eq(Employee::getPassword, pwd);
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
    public Message resetPwd(Integer id) {
        Employee employee = employeeMapper.selectById(id);
        //重置密码
        String pwd = MD5Util.calculatePwd("123456", employee.getEmpId());
        employee.setPassword(pwd);
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
        return Message.success().put("employee", employee);
    }

}
