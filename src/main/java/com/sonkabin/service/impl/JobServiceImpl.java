package com.sonkabin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sonkabin.dto.JobDTO;
import com.sonkabin.entity.Job;
import com.sonkabin.mapper.JobMapper;
import com.sonkabin.service.JobService;
import com.sonkabin.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author sonkabin
 * @since 2019-02-13
 */
@Service
public class JobServiceImpl implements JobService {
    @Autowired
    private JobMapper jobMapper;

    @Override
    public Message getAllJobs(JobDTO jobDTO) {
        Page<Job> page = new Page<>();
        page.setSize(jobDTO.getRows());
        page.setCurrent(jobDTO.getPage());
        LambdaQueryWrapper<Job> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(!StringUtils.isEmpty(jobDTO.getCareer()), Job::getCareer, jobDTO.getCareer());
        wrapper.eq(jobDTO.getStatus().compareTo(-1) != 0, Job::getStatus, jobDTO.getStatus());
        IPage<Job> result = jobMapper.selectPage(page, wrapper);
        return Message.success().put("total", result.getTotal()).put("rows", result.getRecords());
    }

    @Override
    public Message getJob(Integer id) {
        Job job = jobMapper.selectById(id);
        return Message.success().put("job", job);
    }

    @Override
    public Message saveJob(Job job) {
        LocalDateTime now = LocalDateTime.now();
        job.setGmtCreate(now);
        job.setGmtModified(now);
        job.setStatus(0);
        jobMapper.insert(job);
        return Message.success();
    }

    @Override
    public Message updateJob(Job job, Integer id) {
        job.setId(id);
        job.setGmtModified(LocalDateTime.now());
        jobMapper.updateById(job);
        return Message.success();
    }

    @Override
    public Message finishJob(Integer id) {
        Job job = new Job();
        job.setGmtModified(LocalDateTime.now());
        job.setId(id);
        job.setStatus(1);
        jobMapper.updateById(job);
        return Message.success();
    }
}
