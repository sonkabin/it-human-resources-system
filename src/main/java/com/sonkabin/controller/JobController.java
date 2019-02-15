package com.sonkabin.controller;


import com.sonkabin.dto.JobDTO;
import com.sonkabin.entity.Job;
import com.sonkabin.service.JobService;
import com.sonkabin.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 *
 * @author sonkabin
 * @since 2019-02-13
 */
@Controller
//@RequestMapping("/job")
public class JobController {
    @Autowired
    private JobService jobService;

    @ResponseBody
    @GetMapping("/admin/jobs")
    public Message getAllJobs (JobDTO jobDTO) {
        return jobService.getAllJobs(jobDTO);
    }

    @ResponseBody
    @GetMapping("/job/{id}")
    public Message getJob (@PathVariable("id") Integer id) {
        return jobService.getJob(id);
    }

    @ResponseBody
    @PostMapping("/job")
    public Message saveJob (Job job) {
        return jobService.saveJob(job);
    }

    @ResponseBody
    @PutMapping("/job/{id}")
    public Message updateJob (Job job, @PathVariable("id") Integer id) {
        return jobService.updateJob(job, id);
    }

    @ResponseBody
    @PutMapping("/job/finish/{id}")
    public Message finishJob (@PathVariable("id") Integer id) {
        return jobService.finishJob(id);
    }

    /**
     * 招聘者获取的job列表
     * @param jobDTO
     * @return
     */
    @ResponseBody
    @GetMapping("/anon/jobs")
    public Message getJobs (JobDTO jobDTO) {
        return jobService.getJobs(jobDTO);
    }

    @ResponseBody
    @GetMapping("/anon/job/{id}")
    public Message getAnonJob (@PathVariable("id") Integer id) {
        return jobService.getJob(id);
    }
}

