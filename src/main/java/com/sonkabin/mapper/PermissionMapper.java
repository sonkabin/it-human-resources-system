package com.sonkabin.mapper;

import com.sonkabin.entity.Permission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author sonkabin
 * @since 2019-02-18
 */
public interface PermissionMapper extends BaseMapper<Permission> {

    List<String> selectPermissions(Integer roleId);

    List<Map<String, String>> getPermissionsWithRole();
}
