package com.sonkabin.service.impl;

import com.sonkabin.entity.Role;
import com.sonkabin.mapper.RoleMapper;
import com.sonkabin.service.RoleService;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-13
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper RoleMapper;
}
