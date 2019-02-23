package com.sonkabin.controller;


import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import com.sonkabin.service.RolePermissionService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author sonkabin
 * @since 2019-02-23
 */
@Controller
@RequestMapping("/rolePermission")
public class RolePermissionController {
    @Autowired
    private RolePermissionService RolePermissionService;
}

