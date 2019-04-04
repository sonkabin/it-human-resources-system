package com.sonkabin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.sonkabin.entity.JobDescriptionTemplate;
import com.sonkabin.mapper.JobDescriptionTemplateMapper;
import com.sonkabin.service.JobDescriptionTemplateService;
import com.sonkabin.utils.Message;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author sonkabin
 * @since 2019-04-04
 */
@Service
public class JobDescriptionTemplateServiceImpl implements JobDescriptionTemplateService {
    @Autowired
    private JobDescriptionTemplateMapper jobDescriptionTemplateMapper;

    @Override
    public Message getJDTemplate(String job, String experience) {
        if (StringUtils.isEmpty(job)) {
            return Message.success();
        }
        LambdaQueryWrapper<JobDescriptionTemplate> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(JobDescriptionTemplate::getJob, job);
        wrapper.eq(JobDescriptionTemplate::getExperience, experience);
        JobDescriptionTemplate jd = jobDescriptionTemplateMapper.selectOne(wrapper);
        return Message.success().put("responsibility", jd.getResponsibility()).put("demand", jd.getDemand());
    }
}
