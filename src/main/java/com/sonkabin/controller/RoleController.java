package com.sonkabin.controller;


import com.sonkabin.service.RoleService;
import com.sonkabin.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author sonkabin
 * @since 2019-01-13
 */
@RestController
public class RoleController {
    @Autowired
    private RoleService roleService;

    @GetMapping("/roles")
    public Message getRoles () {
        return roleService.getRoles();
    }
}

