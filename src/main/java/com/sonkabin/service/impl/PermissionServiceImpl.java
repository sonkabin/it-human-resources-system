package com.sonkabin.service.impl;

import com.sonkabin.entity.Permission;
import com.sonkabin.entity.RolePermission;
import com.sonkabin.mapper.PermissionMapper;
import com.sonkabin.mapper.RolePermissionMapper;
import com.sonkabin.service.PermissionService;
import com.sonkabin.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author sonkabin
 * @since 2019-02-18
 */
@Service
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    private PermissionMapper permissionMapper;
    @Autowired
    private RolePermissionMapper rolePermissionMapper;

    @Override
    public List<String> getPermissions(Integer roleId) {
        List<String> permissions = permissionMapper.selectPermissions(roleId);
        return permissions;
    }

    @Override
    public Message getAllPermissions() {
        List<Permission> permissions = permissionMapper.selectList(null);
        return Message.success().put("permissions", permissions);
    }

    @Override
    public Message getPermissionsWithRole() {
        List<Map<String,String>> result = permissionMapper.getPermissionsWithRole();
        return Message.success().put("rows", result).put("total", result.size());
    }

    @Transactional
    @Override
    public Message updatePermissions(Integer roleId, String ids) {
        List<Integer> rolePermissionIds = rolePermissionMapper.selectIds(roleId);
        String[] split = ids.split(",");
        List<Integer> idsList = new LinkedList<>();
        for (String s : split) {
            idsList.add(Integer.parseInt(s));
        }
        List<Integer> rolePermissionIdsCopy = new ArrayList<>(rolePermissionIds);
        rolePermissionIds.removeAll(idsList); // 要删除的权限
        idsList.removeAll(rolePermissionIdsCopy); // 要增加的权限
        if (rolePermissionIds.size() > 0) {
            rolePermissionMapper.deleteBatch(roleId, rolePermissionIds);
        }
        if (idsList.size() > 0) {
            rolePermissionMapper.insertBatch(roleId, idsList);
        }
        return Message.success();
    }
}
