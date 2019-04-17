package com.sonkabin.mapper;

import com.sonkabin.entity.Question;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author sonkabin
 * @since 2019-04-13
 */
public interface QuestionMapper extends BaseMapper<Question> {

    List<Question> getQuestions(@Param("domain") String domain);

    List<Integer> selectAnswers(@Param("list") List<Integer> paperIdList);
}
