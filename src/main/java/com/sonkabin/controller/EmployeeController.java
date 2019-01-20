package com.sonkabin.controller;


import com.sonkabin.dto.EmployeeDTO;
import com.sonkabin.entity.Employee;
import com.sonkabin.service.EmployeeService;
import com.sonkabin.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

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
    public Message getEmps(EmployeeDTO employeeDTO){
        return employeeService.getEmps(employeeDTO);
    }

    @ResponseBody
    @PutMapping("/resetPwd/{id}")
    public Message resetPwd (@PathVariable("id") Integer id) {
        return employeeService.resetPwd(id);
    }
}

