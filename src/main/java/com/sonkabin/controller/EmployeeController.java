package com.sonkabin.controller;


import com.sonkabin.dto.EmployeeDTO;
import com.sonkabin.entity.Employee;
import com.sonkabin.service.EmployeeService;
import com.sonkabin.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

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
    @PutMapping("/setPassword/{id}")
    public Message setPassword (@PathVariable("id") Integer id, @RequestParam(value = "oldPassword", required = false) String oldPwd,
                                @RequestParam(value = "newPassword", required = false) String newPwd) {
        return employeeService.setPassword(id, oldPwd, newPwd);
    }


    @GetMapping("/person")
    public String getPersonInfo (HttpSession session, Model model) {
        Employee employee = (Employee) session.getAttribute("loginEmp");
        Message msg = employeeService.getEmpById(employee.getId());
        model.addAttribute("employee", msg.getInfo().get("employee"));
        return "employee/personManage";
    }

    @GetMapping("/skills")
    public String getSkillsInfo (HttpSession session, Model model) {
        Employee employee = (Employee) session.getAttribute("loginEmp");
        Message msg = employeeService.getEmployeeSkills(employee.getId());
        model.addAttribute("employee", msg.getInfo().get("employee"));
        return "employee/skillManage";
    }
}

