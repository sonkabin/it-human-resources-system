package com.sonkabin.controller;


import com.sonkabin.entity.Employee;
import com.sonkabin.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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

    @GetMapping("/emps")
    public String getEmps(Model model){
        List<Employee> emps = employeeService.getEmps();
        model.addAttribute("emps", emps);
        return "admin/emp";
    }
}

