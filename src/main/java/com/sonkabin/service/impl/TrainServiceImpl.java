package com.sonkabin.service.impl;

import com.sonkabin.entity.Train;
import com.sonkabin.mapper.TrainMapper;
import com.sonkabin.service.TrainService;
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
public class TrainServiceImpl implements TrainService {
    @Autowired
    private TrainMapper TrainMapper;
}
