package com.sonkabin.controller;


import com.sonkabin.utils.Message;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;
import com.sonkabin.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author sonkabin
 * @since 2019-02-18
 */
@Controller
public class PermissionController {
    @Autowired
    private PermissionService permissionService;

    @ResponseBody
    @RequiresPermissions("role:query")
    @GetMapping("/permissions")
    public Message getAllPermissions () {
        return permissionService.getAllPermissions();
    }

    @ResponseBody
    @RequiresPermissions("role:query")
    @GetMapping("/permissions/role")
    public Message getPermissionsWithRole () {
        return permissionService.getPermissionsWithRole();
    }

    @ResponseBody
    @RequiresPermissions("role:update")
    @PutMapping("/permissions/{id}")
    public Message updatePermissions (@PathVariable("id") Integer roleId, @RequestParam("ids") String ids) {
        return permissionService.updatePermissions(roleId, ids);
    }
}

