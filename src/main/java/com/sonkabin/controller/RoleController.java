package com.sonkabin.controller;


import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import com.sonkabin.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author sonkabin
 * @since 2019-01-13
 */
@RestController
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService RoleService;
}

