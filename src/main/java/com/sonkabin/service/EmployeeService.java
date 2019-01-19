package com.sonkabin.service;

import com.sonkabin.entity.Employee;
import com.sonkabin.utils.Message;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-13
 */
public interface EmployeeService{
    Employee selectOne(String empId, String pwd);

    void login(String empId, String password);

    List<Employee> getEmps();
}
