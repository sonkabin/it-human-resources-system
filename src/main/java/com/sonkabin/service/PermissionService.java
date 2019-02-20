package com.sonkabin.service;

import com.sonkabin.entity.Permission;
import com.sonkabin.utils.Message;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author sonkabin
 * @since 2019-02-18
 */
public interface PermissionService{

    List<String> getPermissions(Integer roleId);

    Message getAllPermissions();

    Message getPermissionsWithRole();

    Message updatePermissions(Integer roleId, String ids);
}
