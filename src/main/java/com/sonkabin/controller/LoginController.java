package com.sonkabin.controller;

import com.sonkabin.entity.Employee;
import com.sonkabin.service.EmployeeService;
import com.sonkabin.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private EmployeeService employeeService;


    @PostMapping("/login")
    public String login(@RequestParam("empId")String empId, @RequestParam("password")String password, HttpSession session){
        employeeService.login(empId, password);
        Employee loginEmp = (Employee) session.getAttribute("loginEmp");
        Integer id = loginEmp.getRoleId();
        if (id == 3){ // 管理员
            return "redirect:/admin.html";
        } else if (id == 1 || id == 2) { // 员工和项目经理跳转到同一页面，项目模块需要单独处理
            return "redirect:/employee.html";
        }
        return "";
    }

}
