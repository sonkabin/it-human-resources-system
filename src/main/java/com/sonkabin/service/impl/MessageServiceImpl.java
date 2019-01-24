package com.sonkabin.service.impl;

import com.sonkabin.entity.Message;
import com.sonkabin.mapper.MessageMapper;
import com.sonkabin.service.MessageService;
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
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageMapper MessageMapper;
}
