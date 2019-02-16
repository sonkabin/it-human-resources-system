package com.sonkabin.service;

import com.sonkabin.entity.Skill;
import com.sonkabin.utils.Message;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-24
 */
public interface SkillService{

    List<String> getAllSkillNames();

    Message getThreeSkillNames();
}
