package com.sonkabin.service;

import com.sonkabin.entity.EmployeeEvaluation;
import com.sonkabin.utils.Message;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author sonkabin
 * @since 2019-05-06
 */
public interface EmployeeEvaluationService{

    Message listMembers(Integer projectId);

    Message updateScore(Integer projectId, String empIds, String scores);

    Message updateManagerScore(Integer projectId, String empIds, String scores);
}
