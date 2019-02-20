package com.sonkabin.mapper;

import com.sonkabin.entity.RolePermission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author sonkabin
 * @since 2019-02-18
 */
public interface RolePermissionMapper extends BaseMapper<RolePermission> {

    List<Integer> selectIds(Integer roleId);

    void insertBatch(@Param("roleId") Integer roleId, @Param("list") List<Integer> permissionIds);

    void deleteBatch(@Param("roleId") Integer roleId, @Param("list") List<Integer> rolePermissionIds);
}
