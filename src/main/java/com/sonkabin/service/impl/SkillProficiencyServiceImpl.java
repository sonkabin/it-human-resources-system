package com.sonkabin.service.impl;

import com.sonkabin.entity.SkillProficiency;
import com.sonkabin.mapper.SkillProficiencyMapper;
import com.sonkabin.service.SkillProficiencyService;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author sonkabin
 * @since 2019-04-09
 */
@Service
public class SkillProficiencyServiceImpl implements SkillProficiencyService {
    @Autowired
    private SkillProficiencyMapper SkillProficiencyMapper;
}
