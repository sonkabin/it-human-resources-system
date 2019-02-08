package com.sonkabin.controller;


import com.sonkabin.dto.ProjectDTO;
import com.sonkabin.dto.ProjectHistoryDTO;
import com.sonkabin.entity.Project;
import com.sonkabin.entity.ProjectHistory;
import com.sonkabin.utils.Message;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;
import com.sonkabin.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@Controller
public class ProjectController {
    @Autowired
    private ProjectService projectService;

    // ----------------- 项目经理开始 ---------------------------
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
    @ResponseBody
    @PutMapping("/projectContribute")
    public Message updateHumanContributeDetail (@RequestBody List<ProjectHistory> projectHistories) {
        return projectService.updateHumanContributeDetail(projectHistories);
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

    @GetMapping("/project/speedup/{id}")
    public String speedupProject (@PathVariable("id")Integer projectId, Model model) {
        Message msg = projectService.getProjectInformation(projectId);
        model.addAttribute("msg", msg);
        return "employee/manager/speedup";
    }
    // ----------------- 项目经理结束 ---------------------------

    // ----------------- 员工开始     ---------------------------
    @ResponseBody
    @GetMapping("/current/projects")
    public Message getInvolveProjects () {
        return projectService.getInvolveProjects();
    }

    @ResponseBody
    @GetMapping("/history/projects")
    public Message getHistoryProjects (ProjectHistoryDTO projectHistoryDTO) {
        return projectService.getHistoryProjects(projectHistoryDTO);
    }
    // ----------------- 员工结束     ---------------------------
}

