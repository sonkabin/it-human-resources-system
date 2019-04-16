package com.sonkabin.service;

import com.sonkabin.dto.QuestionDTO;
import com.sonkabin.entity.Question;
import com.sonkabin.utils.Message;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author sonkabin
 * @since 2019-04-13
 */
public interface QuestionService{

    Message listQuestions(QuestionDTO questionDTO);

    Message getQuestion(Integer id);

    Message saveQuestion(Question question);

    Message updateQuestion(Question question, Integer id);

    Message deleteQuestion(Integer id);
}
