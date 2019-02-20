package com.sonkabin.controller;

import com.sonkabin.utils.Message;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authz.AuthorizationException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class ExceptionController {

    @ExceptionHandler(AuthenticationException.class)
    public String handleAuthenticationException (Model model) {
        model.addAttribute("error", "用户名或密码错误");
        return "login";
    }

    @ResponseBody
    @ExceptionHandler(AuthorizationException.class)
    public Message handleAuthorizationException () {
        return Message.fail().put("error", "您没有此权限，请联系管理员");
    }
}
