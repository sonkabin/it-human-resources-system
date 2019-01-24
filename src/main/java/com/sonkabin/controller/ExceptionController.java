package com.sonkabin.controller;

import org.apache.shiro.authc.AuthenticationException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionController {

    @ExceptionHandler(AuthenticationException.class)
    public String handleAuthenticationException (Model model) {
        model.addAttribute("msg", "用户名或密码错误");
        return "login";
    }
}
