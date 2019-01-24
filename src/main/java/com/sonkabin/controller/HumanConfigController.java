package com.sonkabin.controller;


import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import com.sonkabin.service.HumanConfigService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@Controller
@RequestMapping("/humanConfig")
public class HumanConfigController {
    @Autowired
    private HumanConfigService HumanConfigService;
}

