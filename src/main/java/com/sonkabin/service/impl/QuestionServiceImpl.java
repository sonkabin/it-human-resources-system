package com.sonkabin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sonkabin.dto.QuestionDTO;
import com.sonkabin.entity.Employee;
import com.sonkabin.entity.Question;
import com.sonkabin.mapper.EmployeeMapper;
import com.sonkabin.mapper.QuestionMapper;
import com.sonkabin.service.QuestionService;
import com.sonkabin.utils.Message;
import com.sonkabin.utils.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

    @Autowired
    private EmployeeMapper employeeMapper;
    private static final int paperSize = 10; // 试卷的题数
    @Override
    public Message makeExamPaper(String domain) {
        Integer id = MyUtil.getSessionEmployee("loginEmp").getId();
        Employee employee = employeeMapper.selectById(id);
        // 如果技能已经有等级了，就返回警告信息
        /*
        存在一个问题，就是Spring 和 SpringMVC，后者包含了前者的字符串，故contains是错误的，必须使用正则表达式
        // error
        if (employee.getSkills().contains(domain)) {
            return Message.fail().put("warn", "已做过相关技能的测评");
        }
         */
        Pattern pattern = Pattern.compile(domain + ":\\d");
        Matcher matcher = pattern.matcher(employee.getSkills());
        if (matcher.find()) {
            return Message.fail().put("warn", "已做过相关技能的测评");
        }

        List<Question> questions = questionMapper.getQuestions(domain); // 技能对应的所有试题
        if (questions.size() == 0) { // 没有对应的试题
            // 因为每次只测评一个技能，故直接追加即可
            String skills = employee.getSkills() + ";" + domain + ":" + "1";
            employee.setSkills(skills);
            employeeMapper.updateById(employee);
            return Message.fail().put("warn", "由于不存在试题，故技能等级将设为1，可联系管理员进行等级修改");
        }
        int len = questions.size();
        // 有题目的情况，选择10道题返回
        if (len <= paperSize) {
            return Message.success().put("paper", questions);
        } else {
            // Question类实现了equals和hashCode方法，故可直接放入HashSet中，默认16个元素，0.75的负载因子，对于10个题目来说差不多
            Set<Question> paper = new HashSet<>();
            while (paper.size() < paperSize) {
                int rand = (int)(Math.random() * len);
                paper.add(questions.get(rand));
            }
            return Message.success().put("paper", paper);
        }
    }

    @Override
    public Message submitPaper(String paperIds, String answers, String domain) {
        String[] strings = paperIds.split(",");
        List<Integer> paperIdList = new ArrayList<>();
        for (String s : strings) {
            paperIdList.add(Integer.parseInt(s));
        }
        List<Integer> correctAnswers = questionMapper.selectAnswers(paperIdList);
        strings = answers.split(",");
        int correctCount = 0;
        for (int i = 0, len = correctAnswers.size(); i < len; i++) {
            if (correctAnswers.get(i) == Integer.parseInt(strings[i])) {
                correctCount++;
            }
        }
        int level = (int)(correctCount * 1.0 / correctAnswers.size() * 10); // 正确题数/总数=正确概率，乘10后得到等级
        // 等级需要平滑处理，若为0，改为1；若为10，改为9
        if (level == 0) {
            level = 1;
        } else if (level == 10) {
            level = 9;
        }
        Integer id = MyUtil.getSessionEmployee("loginEmp").getId();
        Employee employee = employeeMapper.selectById(id);
        StringBuffer buffer = new StringBuffer(employee.getSkills());
        buffer.append(";");
        buffer.append(domain);
        buffer.append(":");
        buffer.append(level);
        employee.setSkills(buffer.toString());
        employeeMapper.updateById(employee);
        return Message.success().put("correctNum", correctCount).put("total", correctAnswers.size());
    }

}
