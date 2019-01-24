package com.sonkabin.controller;


import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import com.sonkabin.service.SkillService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@Controller
@RequestMapping("/skill")
public class SkillController {
    @Autowired
    private SkillService SkillService;
}

