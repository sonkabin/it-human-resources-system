package com.sonkabin.controller;


import com.sonkabin.service.SkillService;
import com.sonkabin.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@RestController
public class SkillController {
    @Autowired
    private SkillService skillService;

    @GetMapping("/skills/group")
    public Message getThreeSkillNames () {
        return skillService.getThreeSkillNames();
    }

    @GetMapping("/skills/list")
    public Message listSkills () {
        return Message.success().put("skills", skillService.getAllSkillNames());
    }
}

