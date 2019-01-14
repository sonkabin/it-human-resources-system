package com.sonkabin.controller;

import com.sonkabin.service.EmployeeService;
import com.sonkabin.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LoginController {

    @Autowired
    private EmployeeService employeeService;

    @PostMapping("/login")
    public Message login(@RequestParam("empId")String empId, @RequestParam("password")String password){
        return employeeService.login(empId,password);
    }

    @GetMapping("/logout")
    public Message logout(){
        return employeeService.logout();
    }
}
