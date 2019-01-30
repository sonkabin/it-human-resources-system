package com.sonkabin.mapper;

import com.sonkabin.entity.Employee;
import com.sonkabin.entity.HumanConfig;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-24
 */
public interface HumanConfigMapper extends BaseMapper<HumanConfig> {

    List<Map<String, Object>> selectPortion(List<Employee> employees);
}
