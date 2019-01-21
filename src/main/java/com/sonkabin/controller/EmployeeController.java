package com.sonkabin.controller;


import com.sonkabin.dto.EmployeeDTO;
import com.sonkabin.entity.Employee;
import com.sonkabin.service.EmployeeService;
import com.sonkabin.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 *
 * @author sonkabin
 * @since 2019-01-13
 */
@Controller
//@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @ResponseBody
    @GetMapping("/emps")
    public Message getEmployees(EmployeeDTO employeeDTO){
        return employeeService.getEmps(employeeDTO);
    }

    @ResponseBody
    @PostMapping("/emp")
    public Message saveEmployee (Employee employee) {
        return employeeService.saveEmployee(employee);
    }

    @ResponseBody
    @GetMapping("/emp/{id}")
    public Message getEmployee (@PathVariable("id") Integer id) {
        return employeeService.getEmpById(id);
    }

    @ResponseBody
    @GetMapping("/empWithRole/{id}")
    public Message getEmpWithRole (@PathVariable("id") Integer id) {
        return employeeService.getEmpWithRoleById(id);
    }

    @ResponseBody
    @PutMapping("/emp/{id}")
    public Message updateEmployee (Employee employee) {
        return employeeService.updateEmployee(employee);
    }

    @ResponseBody
    @PutMapping("/resetPwd/{id}")
    public Message resetPwd (@PathVariable("id") Integer id) {
        return employeeService.resetPwd(id);
    }
}

