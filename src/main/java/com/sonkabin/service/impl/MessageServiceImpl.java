package com.sonkabin.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sonkabin.dto.MessageDTO;
import com.sonkabin.mapper.MessageMapper;
import com.sonkabin.service.MessageService;
import com.sonkabin.utils.Message;
import com.sonkabin.utils.MessageUtil;
import com.sonkabin.utils.MyUtil;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDateTime;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author sonkabin
 * @since 2019-04-02
 */
@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageMapper messageMapper;

    @Override
    public Message sendMessage(String empName, String projectName, Integer receiverId, String receiverName) {
        String content = MessageUtil.NotInserviceMessage(empName, projectName);
        com.sonkabin.entity.Message message = new com.sonkabin.entity.Message();
        message.setContent(content);
        message.setReceiverId(receiverId);
        message.setSender("管理员");
        message.setStatus(0);
        message.setReceiverName(receiverName);
        LocalDateTime now = LocalDateTime.now();
        message.setGmtCreate(now);
        message.setGmtModified(now);
        messageMapper.insert(message);
        return Message.success();
    }

    @Override
    public Message listSendMessages(MessageDTO messageDTO) {
        LambdaQueryWrapper<com.sonkabin.entity.Message> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(com.sonkabin.entity.Message::getSender, "管理员");
        IPage<?> result = selectPage(messageDTO, wrapper);
        return Message.success().put("total", result.getTotal()).put("rows", result.getRecords());
    }

    @Override
    public Message deleteMessage(Integer id) {
        messageMapper.deleteById(id);
        return Message.success();
    }

    @Override
    public Message listReceiveMessages(MessageDTO messageDTO) {
        LambdaQueryWrapper<com.sonkabin.entity.Message> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(com.sonkabin.entity.Message::getReceiverId, MyUtil.getSessionEmployee("loginEmp").getId());
        IPage<?> result = selectPage(messageDTO, wrapper);
        return Message.success().put("total", result.getTotal()).put("rows", result.getRecords());
    }

    @Override
    public Message markMessage(Integer id) {
        com.sonkabin.entity.Message message = new com.sonkabin.entity.Message();
        message.setStatus(1);
        message.setId(id);
        messageMapper.updateById(message);
        return Message.success();
    }

    private IPage<?> selectPage(MessageDTO messageDTO, Wrapper<com.sonkabin.entity.Message> wrapper) {
        Page<com.sonkabin.entity.Message> page = new Page<>();
        page.setCurrent(messageDTO.getPage());
        page.setSize(messageDTO.getRows());
        return messageMapper.selectPage(page, wrapper);
    }
}
