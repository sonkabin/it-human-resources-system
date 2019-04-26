package com.sonkabin.service;

import com.sonkabin.dto.MessageDTO;
import com.sonkabin.utils.Message;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author sonkabin
 * @since 2019-04-02
 */
public interface MessageService{

    Message sendMessage(String empName, String projectName, Integer receiverId, String receiverName);

    Message listSendMessages(MessageDTO messageDTO);

    Message deleteMessage(Integer id);

    Message listReceiveMessages(MessageDTO messageDTO);

    Message markMessage(Integer id);

    Message listHRReceiveMessages(MessageDTO messageDTO);
}
