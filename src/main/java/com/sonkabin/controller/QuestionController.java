package com.sonkabin.controller;


import com.sonkabin.dto.QuestionDTO;
import com.sonkabin.entity.Employee;
import com.sonkabin.entity.Question;
import com.sonkabin.service.EmployeeService;
import com.sonkabin.service.QuestionService;
import com.sonkabin.service.SkillService;
import com.sonkabin.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author sonkabin
 * @since 2019-04-13
 */
@Controller
public class QuestionController {
    @Autowired
    private QuestionService questionService;

    // ----管理员试题管理开始-----
    @ResponseBody
    @GetMapping("/questions")
    public Message listQuestions(QuestionDTO questionDTO) {
        return questionService.listQuestions(questionDTO);
    }

    @ResponseBody
    @GetMapping("/question/{id}")
    public Message getQuestion(@PathVariable("id") Integer id) {
        return questionService.getQuestion(id);
    }

    @ResponseBody
    @PostMapping("/question")
    public Message saveQuestion(Question question) {
        return questionService.saveQuestion(question);
    }

    @ResponseBody
    @PutMapping("/question/{id}")
    public Message updateQuestion(Question question, @PathVariable("id") Integer id) {
        return questionService.updateQuestion(question, id);
    }

    @ResponseBody
    @DeleteMapping("/question/{id}")
    public Message deleteQuestion(@PathVariable("id") Integer id) {
        return questionService.deleteQuestion(id);
    }
    // ----管理员试题管理结束-----

    // ---员工试题操作开始---
    /**
     * 组卷
     * @param domain
     * @return
     */
    @ResponseBody
    @GetMapping("/exam")
    public Message makeExamPaper(@RequestParam("domain") String domain) {
        return questionService.makeExamPaper(domain);
    }

    /**
     * 提交试题答案
     * @param paperIds：试题的id字符串，用 , 分割
     * @param answers：对应的回答索引号，用 , 分割
     * @param domain：试题所属领域
     * @return
     */
    @PutMapping("/paper")
    public String submitPaper(@RequestParam("ids") String paperIds, @RequestParam("answers") String answers,
                              @RequestParam("domain") String domain) {
        questionService.submitPaper(paperIds, answers, domain);
        return "redirect:/skills";
    }

}

