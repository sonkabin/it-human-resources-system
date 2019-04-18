package com.sonkabin.mapper;

import com.sonkabin.entity.SkillProficiency;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author sonkabin
 * @since 2019-04-09
 */
public interface SkillProficiencyMapper extends BaseMapper<SkillProficiency> {

    SkillProficiency selectByEmpId(Integer empId);

    void updateByEmpId(@Param("sp") SkillProficiency sp);
}
