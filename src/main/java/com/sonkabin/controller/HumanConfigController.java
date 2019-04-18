package com.sonkabin.controller;


import com.sonkabin.dto.RecalculateDTO;
import com.sonkabin.entity.HumanConfig;
import com.sonkabin.utils.Message;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;
import com.sonkabin.service.HumanConfigService;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@Controller
public class HumanConfigController {
    @Autowired
    private HumanConfigService humanConfigService;

    // 返回项目启动之前计算分配的人员和所有人员，供项目经理进行人员微调
    @GetMapping("/calculate/{id}")
    public String calculateHumans (@PathVariable("id")Integer projectId, Model model) {
        Message msg = humanConfigService.calculateHumans(projectId);
        model.addAttribute("msg", msg);
        return "employee/manager/projectConfig";
    }

    // 保存项目人员配置，并启动项目
    @ResponseBody
    @RequiresPermissions("config:add")
    @PostMapping("/startProject")
    public Message startProject (@RequestBody List<HumanConfig> configs) {
        return humanConfigService.startProject(configs);
    }
    // 加快项目进度，保存新的结束日期和新增的人员
    @ResponseBody
    @RequiresPermissions("config:add")
    @PostMapping("/humanConfig")
    public Message saveConfig (@RequestBody List<HumanConfig> configs, @DateTimeFormat(pattern = "yyyy-MM-dd") @RequestParam("endDate") LocalDate endDate) {
        return humanConfigService.saveConfig(configs, endDate);
    }

    @GetMapping("/humanConfigs/{id}")
    public String getHumanConfigs (@PathVariable("id") Integer projectId, Model model) {
        Message msg = humanConfigService.getHumanConfigs(projectId);
        model.addAttribute("info", msg.getInfo());
        return "employee/manager/dispatcher";
    }

    /**
     * 释放项目成员，不再占用成员的工作时间
     * @param config
     * @param contribute：成员做的贡献
     * @return
     */
    @ResponseBody
    @RequiresPermissions("config:update")
    @PutMapping("/humanConfig/release")
    public Message releaseHuman (HumanConfig config, @RequestParam("contribute") String contribute) {
        return humanConfigService.releaseHuman(config, contribute);
    }

    @ResponseBody
    @RequiresPermissions("config:query")
    @GetMapping("/humanConfigs/employees/{id}")
    public Message getOtherEmployees (@PathVariable("id") Integer projectId) {
        return humanConfigService.getOtherEmployees(projectId);
    }

    @ResponseBody
    @RequiresPermissions("config:update")
    @PostMapping("/humanConfig/require")
    public Message requireHuman (@RequestBody List<HumanConfig> configs) {
        return humanConfigService.requireHuman(configs);
    }

    @ResponseBody
    @RequiresPermissions("config:query")
    @PostMapping("/humanConfig/recalculate")
    public Message recalculate (RecalculateDTO recalculateDTO) {
        return humanConfigService.recalculate(recalculateDTO);
    }


}

