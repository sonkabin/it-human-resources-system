package com.sonkabin.service.impl;

import com.sonkabin.entity.HumanConfigTemp;
import com.sonkabin.mapper.HumanConfigTempMapper;
import com.sonkabin.service.HumanConfigTempService;
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
public class HumanConfigTempServiceImpl implements HumanConfigTempService {
    @Autowired
    private HumanConfigTempMapper HumanConfigTempMapper;
}
