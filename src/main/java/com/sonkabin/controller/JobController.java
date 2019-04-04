package com.sonkabin.controller;


import com.sonkabin.dto.JobDTO;
import com.sonkabin.entity.Job;
import com.sonkabin.service.JobService;
import com.sonkabin.utils.Message;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 *
 * @author sonkabin
 * @since 2019-02-13
 */
@RestController
public class JobController {
    @Autowired
    private JobService jobService;

    @GetMapping("/admin/jobs")
    public Message getAllJobs (JobDTO jobDTO) {
        return jobService.getAllJobs(jobDTO);
    }

    @GetMapping("/job/{id}")
    public Message getJob (@PathVariable("id") Integer id) {
        return jobService.getJob(id);
    }

    @RequiresPermissions("job:add")
    @PostMapping("/job")
    public Message saveJob (Job job) {
        return jobService.saveJob(job);
    }

    @RequiresPermissions("job:update")
    @PutMapping("/job/{id}")
    public Message updateJob (Job job, @PathVariable("id") Integer id) {
        return jobService.updateJob(job, id);
    }

    @RequiresPermissions("job:update")
    @PutMapping("/job/finish/{id}")
    public Message finishJob (@PathVariable("id") Integer id) {
        return jobService.finishJob(id);
    }

    /**
     * 招聘者获取的job列表
     * @param jobDTO
     * @return
     */

    @GetMapping("/anon/jobs")
    public Message getJobs (JobDTO jobDTO) {
        return jobService.getJobs(jobDTO);
    }


    @GetMapping("/anon/job/{id}")
    public Message getAnonJob (@PathVariable("id") Integer id) {
        return jobService.getJob(id);
    }

    /**
     * 人员不够时由管理员通过消息管理页面直接发起的职位招聘
     * @param id：消息id
     * @return
     */
    @PostMapping("/postJob/{id}")
    public Message postJob (Job job, @PathVariable("id") Integer id) {
        return jobService.postJob(job, id);
    }
}

