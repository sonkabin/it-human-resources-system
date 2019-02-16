package com.sonkabin.mapper;

import com.sonkabin.entity.Skill;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-24
 */
public interface SkillMapper extends BaseMapper<Skill> {

    List<String> selectAllSkillNames();
}
