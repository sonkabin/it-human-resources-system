package com.sonkabin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.sonkabin.entity.Employee;
import com.sonkabin.entity.EmployeeEvaluation;
import com.sonkabin.entity.Project;
import com.sonkabin.mapper.EmployeeEvaluationMapper;
import com.sonkabin.mapper.ProjectMapper;
import com.sonkabin.service.EmployeeEvaluationService;
import com.sonkabin.utils.Message;
import com.sonkabin.utils.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author sonkabin
 * @since 2019-05-06
 */
@Service
public class EmployeeEvaluationServiceImpl implements EmployeeEvaluationService {
    @Autowired
    private EmployeeEvaluationMapper employeeEvaluationMapper;

    @Override
    public Message listMembers(Integer projectId) {
        Employee loginEmp = MyUtil.getSessionEmployee("loginEmp");
        LambdaQueryWrapper<EmployeeEvaluation> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(EmployeeEvaluation::getProjectId, projectId).and(ee -> ee.ne(EmployeeEvaluation::getEmpId, loginEmp.getId()));
        List<EmployeeEvaluation> evaluations = employeeEvaluationMapper.selectList(wrapper);
        return Message.success().put("evaluations", evaluations);
    }

    @Transactional
    @Override
    public Message updateScore(Integer projectId, String empIds, String scores) {
        String[] empIdArray = empIds.split(",");
        String[] scoreArray = scores.split(",");
        for (int i = 0; i < empIdArray.length; i++) {
            employeeEvaluationMapper.updateByProjectIdAndEmpId(projectId, Integer.parseInt(empIdArray[i]), Integer.parseInt(scoreArray[i]));
        }
        // 更新登录用户的status
        Employee loginEmp = MyUtil.getSessionEmployee("loginEmp");
        LambdaQueryWrapper<EmployeeEvaluation> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(EmployeeEvaluation::getEmpId, loginEmp.getId()).eq(EmployeeEvaluation::getProjectId, projectId);
        EmployeeEvaluation employeeEvaluation = employeeEvaluationMapper.selectOne(wrapper);
        employeeEvaluation.setStatus(1);
        employeeEvaluationMapper.updateById(employeeEvaluation);
        return Message.success();
    }

    @Autowired
    private ProjectMapper projectMapper;
    @Transactional
    @Override
    public Message updateManagerScore(Integer projectId, String empIds, String scores) {
        String[] empIdArray = empIds.split(",");
        String[] scoreArray = scores.split(",");
        for (int i = 0; i < empIdArray.length; i++) {
            employeeEvaluationMapper.updateManagerScore(projectId, Integer.parseInt(empIdArray[i]), Integer.parseInt(scoreArray[i]));
        }
        Project project = new Project();
        project.setId(projectId);
        project.setManagerStatus(1);
        projectMapper.updateById(project);
        return Message.success();
    }

}
