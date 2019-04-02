package com.sonkabin.controller;


import com.sonkabin.dto.MessageDTO;
import com.sonkabin.utils.Message;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;
import com.sonkabin.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author sonkabin
 * @since 2019-04-02
 */
@Controller
public class MessageController {
    @Autowired
    private MessageService messageService;

    @ResponseBody
    @PostMapping("/message")
    public Message sendMessage(@RequestParam("empName") String empName, @RequestParam("projectName") String projectName,
                                @RequestParam("receiverId") Integer receiverId, @RequestParam("receiverName") String receiverName) {
        return messageService.sendMessage(empName, projectName, receiverId, receiverName);
    }

    @ResponseBody
    @GetMapping("/messages/send")
    public Message listSendMessages(MessageDTO messageDTO) {
        return messageService.listSendMessages(messageDTO);
    }

    @ResponseBody
    @DeleteMapping("/message/{id}")
    public Message deleteMessage(@PathVariable("id") Integer id) {
        return messageService.deleteMessage(id);
    }

    @ResponseBody
    @GetMapping("/messages/receive")
    public Message listReceiveMessages(MessageDTO messageDTO) {
        return messageService.listReceiveMessages(messageDTO);
    }

    @ResponseBody
    @PutMapping("/message/{id}")
    public Message markMessage(@PathVariable("id") Integer id) {
        return messageService.markMessage(id);
    }
}

