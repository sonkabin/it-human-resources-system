package com.sonkabin.controller;


import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import com.sonkabin.service.ProjectHistoryService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@Controller
@RequestMapping("/projectHistory")
public class ProjectHistoryController {
    @Autowired
    private ProjectHistoryService ProjectHistoryService;
}

