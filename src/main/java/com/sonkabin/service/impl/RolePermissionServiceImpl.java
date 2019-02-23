package com.sonkabin.service.impl;

import com.sonkabin.entity.RolePermission;
import com.sonkabin.mapper.RolePermissionMapper;
import com.sonkabin.service.RolePermissionService;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author sonkabin
 * @since 2019-02-23
 */
@Service
public class RolePermissionServiceImpl implements RolePermissionService {
    @Autowired
    private RolePermissionMapper RolePermissionMapper;
}
