package com.sonkabin.service;

import com.sonkabin.dto.EmployeeDTO;
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

    void login(String empId, String password);

    Message getEmps(EmployeeDTO employeeDTO);

    Message resetPwd(Integer id);

    Message saveEmployee(Employee employee);

    Message getEmpById(Integer id);

    Message getEmpWithRoleById(Integer id);

    Message updateEmployee(Employee employee);

    Message getEmployeeSkills(Integer id);
}
