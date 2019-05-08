package com.sonkabin.controller;


import com.sonkabin.service.EmployeeEvaluationService;
import com.sonkabin.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 *
 * @author sonkabin
 * @since 2019-05-06
 */
@Controller
public class EmployeeEvaluationController {
    @Autowired
    private EmployeeEvaluationService employeeEvaluationService;

    @ResponseBody
    @GetMapping("/evaluation/{id}")
    public Message listMembers(@PathVariable("id") Integer projectId) {
        return employeeEvaluationService.listMembers(projectId);
    }

    @ResponseBody
    @PutMapping("/evaluation/{id}")
    public Message updateScore(@PathVariable("id") Integer projectId, @RequestParam("empIds") String empIds, @RequestParam("scores") String scores) {
        return employeeEvaluationService.updateScore(projectId, empIds, scores);
    }

    @ResponseBody
    @PutMapping("/manager/evaluation/{id}")
    public Message updateManagerScore(@PathVariable("id") Integer projectId, @RequestParam("empIds") String empIds, @RequestParam("scores") String scores) {
        return employeeEvaluationService.updateManagerScore(projectId, empIds, scores);
    }
}

