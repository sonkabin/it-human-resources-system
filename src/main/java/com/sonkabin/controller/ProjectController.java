package com.sonkabin.controller;


import com.sonkabin.dto.ProjectDTO;
import com.sonkabin.entity.Project;
import com.sonkabin.utils.Message;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;
import com.sonkabin.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;

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

    @ResponseBody
    @PostMapping("/project")
    public Message saveProject (Project project) {
        return projectService.saveProject(project);
    }

    // 获取项目成员贡献数据
    @ResponseBody
    @GetMapping("/projectContribute/{id}")
    public Message getHumanContributeDetail (@PathVariable("id") Integer id) {
        return projectService.getHumanDetailByProjectId(id);
    }

    // 返回项目启动之前计算分配的人员和所有人员，供项目经理进行人员微调
    @GetMapping("/calculate/{id}")
    public String calculateHumans (@PathVariable("id")Integer projectId, Model model) {
        Message msg = projectService.calculateHumans(projectId);
        model.addAttribute("msg", msg);
        return "employee/manager/projectConfig";
    }

    @ResponseBody
    @DeleteMapping("/project/{id}")
    public Message deleteProject (@PathVariable("id") Integer projectId) {
        return projectService.deleteProject(projectId);
    }

    @ResponseBody
    @GetMapping("/project/{id}")
    public Message getProjectInformation (@PathVariable("id") Integer id) {
        return projectService.getProjectInformation(id);
    }

    @ResponseBody
    @PutMapping("/project/{id}")
    public Message updateProjectInformation (@PathVariable("id") Integer id, Project project) {
        return projectService.updateProjectInformation(id,project);
    }

    @ResponseBody
    @PutMapping("/project/finish/{id}")
    public Message finishProject (@PathVariable("id") Integer id) {
        return projectService.finishProject(id);
    }

}

