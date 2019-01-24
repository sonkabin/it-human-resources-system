package com.sonkabin.controller;


import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import com.sonkabin.service.HumanConfigTempService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@Controller
@RequestMapping("/humanConfigTemp")
public class HumanConfigTempController {
    @Autowired
    private HumanConfigTempService HumanConfigTempService;
}

