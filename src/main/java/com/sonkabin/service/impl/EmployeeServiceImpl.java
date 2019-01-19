package com.sonkabin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sonkabin.entity.Employee;
import com.sonkabin.mapper.EmployeeMapper;
import com.sonkabin.service.EmployeeService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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

    public List<Employee> getEmps() {
//        IPage<Employee> iPage = new Page<>();
//        LambdaQueryWrapper<Employee> wrapper = new LambdaQueryWrapper<>();
//        employeeMapper.selectMapsPage(iPage, wrapper);
        List<Employee> employees = employeeMapper.selectList(null);
        return employees;
    }

}
