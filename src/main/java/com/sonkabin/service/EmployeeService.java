package com.sonkabin.service;

import com.sonkabin.entity.Employee;
import com.sonkabin.utils.Message;

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

    Message login(String empId, String password);

    Message logout();
}
