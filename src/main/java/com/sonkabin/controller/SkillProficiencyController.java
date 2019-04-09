package com.sonkabin.controller;


import com.sonkabin.service.SkillProficiencyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 *
 * @author sonkabin
 * @since 2019-04-09
 */
@Controller
public class SkillProficiencyController {
    @Autowired
    private SkillProficiencyService SkillProficiencyService;
}

