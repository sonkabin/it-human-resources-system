package com.sonkabin.service.impl;

import com.sonkabin.entity.Skill;
import com.sonkabin.mapper.SkillMapper;
import com.sonkabin.service.SkillService;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@Service
public class SkillServiceImpl implements SkillService {
    @Autowired
    private SkillMapper SkillMapper;
}
