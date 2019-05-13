package com.sonkabin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sonkabin.entity.EmployeeEvaluation;
import com.sonkabin.entity.HumanConfig;
import com.sonkabin.entity.Project;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author sonkabin
 * @since 2019-05-06
 */
public interface EmployeeEvaluationMapper extends BaseMapper<EmployeeEvaluation> {

    List<EmployeeEvaluation> selectMyList(@Param("projectIds") List<Integer> projectIds, @Param("empId") Integer empId);

    void insertBatch(@Param("configs") List<HumanConfig> configs, @Param("projectId") Integer projectId);

    void updateByProjectIdAndEmpId(@Param("projectId") Integer projectId, @Param("empId") int empId, @Param("score") int score);

    void updateManagerScore(@Param("projectId") Integer projectId, @Param("empId") int empId, @Param("score") int score);

    List<Map<String, Object>> selectStatistics();
}
