package com.sonkabin.service.impl;

import com.sonkabin.entity.TrainDemand;
import com.sonkabin.mapper.TrainDemandMapper;
import com.sonkabin.service.TrainDemandService;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author sonkabin
 * @since 2019-02-23
 */
@Service
public class TrainDemandServiceImpl implements TrainDemandService {
    @Autowired
    private TrainDemandMapper TrainDemandMapper;
}
