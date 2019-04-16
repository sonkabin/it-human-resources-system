package com.sonkabin.controller;


import com.sonkabin.dto.QuestionDTO;
import com.sonkabin.entity.Question;
import com.sonkabin.service.QuestionService;
import com.sonkabin.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 *
 * @author sonkabin
 * @since 2019-04-13
 */
@RestController
public class QuestionController {
    @Autowired
    private QuestionService questionService;

    // ----管理员试题管理开始-----
    @GetMapping("/questions")
    public Message listQuestions(QuestionDTO questionDTO) {
        return questionService.listQuestions(questionDTO);
    }

    @GetMapping("/question/{id}")
    public Message getQuestion(@PathVariable("id") Integer id) {
        return questionService.getQuestion(id);
    }

    @PostMapping("/question")
    public Message saveQuestion(Question question) {
        return questionService.saveQuestion(question);
    }

    @PutMapping("/question/{id}")
    public Message updateQuestion(Question question, @PathVariable("id") Integer id) {
        return questionService.updateQuestion(question, id);
    }

    @DeleteMapping("/question/{id}")
    public Message deleteQuestion(@PathVariable("id") Integer id) {
        return questionService.deleteQuestion(id);
    }

    // ----管理员试题管理结束-----
}

