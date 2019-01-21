package com.sonkabin.mapper;

import com.sonkabin.entity.Employee;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-13
 */
public interface EmployeeMapper extends BaseMapper<Employee> {

    Employee getEmpWithRoleById(@Param("id") Integer id);
}
