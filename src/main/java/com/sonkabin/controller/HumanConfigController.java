package com.sonkabin.controller;


import com.sonkabin.entity.HumanConfig;
import com.sonkabin.utils.Message;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;
import com.sonkabin.service.HumanConfigService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@Controller
//@RequestMapping("/humanConfig")
public class HumanConfigController {
    @Autowired
    private HumanConfigService humanConfigService;

    // 保存项目人员配置，并启动项目
    @ResponseBody
    @PostMapping("/config")
    public Message saveConfig (@RequestBody List<HumanConfig> configs) {
        return humanConfigService.saveConfig(configs);
    }

    @GetMapping("/humanConfigs/{id}")
    public String getHumanConfigs (@PathVariable("id") Integer projectId, Model model) {
        Message msg = humanConfigService.getHumanConfigs(projectId);
        model.addAttribute("info", msg.getInfo());
        return "employee/manager/dispatcher";
    }


    public Message releaseHuman () {
        return null;
    }
}

