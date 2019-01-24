package com.sonkabin.controller;


import com.sonkabin.dto.ProjectDTO;
import com.sonkabin.utils.Message;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import com.sonkabin.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@Controller
public class ProjectController {
    @Autowired
    private ProjectService projectService;

    @ResponseBody
    @GetMapping("/projects")
    public Message getProjects (ProjectDTO projectDTO) {
        return projectService.getProjects(projectDTO);
    }
}

