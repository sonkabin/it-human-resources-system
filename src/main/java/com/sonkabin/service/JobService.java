package com.sonkabin.service;

import com.sonkabin.dto.JobDTO;
import com.sonkabin.entity.Job;
import com.sonkabin.utils.Message;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author sonkabin
 * @since 2019-02-13
 */
public interface JobService{

 Message getAllJobs(JobDTO jobDTO);

 Message getJob(Integer id);

 Message saveJob(Job job);

 Message updateJob(Job job, Integer id);

 Message finishJob(Integer id);
}
