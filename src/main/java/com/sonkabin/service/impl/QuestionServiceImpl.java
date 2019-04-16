package com.sonkabin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sonkabin.dto.QuestionDTO;
import com.sonkabin.entity.Question;
import com.sonkabin.mapper.QuestionMapper;
import com.sonkabin.service.QuestionService;
import com.sonkabin.utils.Message;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author sonkabin
 * @since 2019-04-13
 */
@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    private QuestionMapper questionMapper;

    @Override
    public Message listQuestions(QuestionDTO questionDTO) {
        Page<Question> page = new Page<>();
        page.setSize(questionDTO.getRows());
        page.setCurrent(questionDTO.getPage());
        LambdaQueryWrapper<Question> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(!StringUtils.isEmpty(questionDTO.getDomain()), Question::getDomain, questionDTO.getDomain()); // 筛选试题的技能所属领域
        String sort = questionDTO.getSort();
        // 按照修改时间或试题所属领域排序
        if (!StringUtils.isEmpty(sort)) {
            if (QuestionDTO.GMT_MODIFIED.equals(sort)) {
                wrapper.orderBy(true, questionDTO.getSortOrder().equals("asc"), Question::getGmtCreate);
            } else {
                wrapper.orderBy(true, questionDTO.getSortOrder().equals("asc"), Question::getDomain);
            }
        }
        IPage<Question> result = questionMapper.selectPage(page, wrapper);
        return Message.success().put("total", result.getTotal()).put("rows", result.getRecords());
    }

    @Override
    public Message getQuestion(Integer id) {
        Question question = questionMapper.selectById(id);
        return Message.success().put("question", question);
    }

    @Override
    public Message saveQuestion(Question question) {
        LocalDateTime now = LocalDateTime.now();
        question.setGmtCreate(now);
        question.setGmtModified(now);
        questionMapper.insert(question);
        return Message.success();
    }

    @Override
    public Message updateQuestion(Question question, Integer id) {
        question.setGmtModified(LocalDateTime.now());
        question.setId(id);
        questionMapper.updateById(question);
        return Message.success();
    }

    @Override
    public Message deleteQuestion(Integer id) {
        questionMapper.deleteById(id);
        return Message.success();
    }
}
