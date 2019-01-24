package com.sonkabin.service.impl;

import com.sonkabin.entity.Plan;
import com.sonkabin.mapper.PlanMapper;
import com.sonkabin.service.PlanService;
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
public class PlanServiceImpl implements PlanService {
    @Autowired
    private PlanMapper PlanMapper;
}
