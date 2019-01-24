package com.sonkabin.service.impl;

import com.sonkabin.entity.Recruit;
import com.sonkabin.mapper.RecruitMapper;
import com.sonkabin.service.RecruitService;
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
public class RecruitServiceImpl implements RecruitService {
    @Autowired
    private RecruitMapper RecruitMapper;
}
