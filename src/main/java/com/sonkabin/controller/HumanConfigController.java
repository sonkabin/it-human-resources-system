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
    @PostMapping("/humanConfig")
    public Message saveConfig (@RequestBody List<HumanConfig> configs) {
        return humanConfigService.saveConfig(configs);
    }

    @GetMapping("/humanConfigs/{id}")
    public String getHumanConfigs (@PathVariable("id") Integer projectId, Model model) {
        Message msg = humanConfigService.getHumanConfigs(projectId);
        model.addAttribute("info", msg.getInfo());
        return "employee/manager/dispatcher";
    }

    @ResponseBody
    @PutMapping("/humanConfig/release")
    public Message releaseHuman (HumanConfig config, @RequestParam("contribute") String contribute) {
        return humanConfigService.releaseHuman(config, contribute);
    }

    @ResponseBody
    @GetMapping("/humanConfigs/employees/{id}")
    public Message getOtherEmployees (@PathVariable("id") Integer projectId) {
        return humanConfigService.getOtherEmployees(projectId);
    }

    @ResponseBody
    @PostMapping("/humanConfig/require")
    public Message requireHuman (@RequestBody List<HumanConfig> configs) {
        return humanConfigService.requireHuman(configs);
    }
}

