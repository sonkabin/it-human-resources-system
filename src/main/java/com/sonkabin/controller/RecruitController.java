package com.sonkabin.controller;


import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import com.sonkabin.service.RecruitService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@Controller
@RequestMapping("/recruit")
public class RecruitController {
    @Autowired
    private RecruitService RecruitService;
}

