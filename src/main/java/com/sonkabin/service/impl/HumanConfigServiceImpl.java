package com.sonkabin.service.impl;

import com.sonkabin.entity.HumanConfig;
import com.sonkabin.mapper.HumanConfigMapper;
import com.sonkabin.service.HumanConfigService;
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
public class HumanConfigServiceImpl implements HumanConfigService {
    @Autowired
    private HumanConfigMapper HumanConfigMapper;
}
