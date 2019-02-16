package com.sonkabin.controller;


import com.sonkabin.service.SkillService;
import com.sonkabin.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@Controller
public class SkillController {
    @Autowired
    private SkillService skillService;

    @ResponseBody
    @GetMapping("/skills/group")
    public Message getThreeSkillNames () {
        return skillService.getThreeSkillNames();
    }
}

