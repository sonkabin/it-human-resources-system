package com.sonkabin.controller;


import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import com.sonkabin.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author sonkabin
 * @since 2019-04-02
 */
@Controller
@RequestMapping("/message")
public class MessageController {
    @Autowired
    private MessageService MessageService;
}

