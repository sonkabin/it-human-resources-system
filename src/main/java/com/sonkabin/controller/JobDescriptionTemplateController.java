package com.sonkabin.controller;


import com.sonkabin.service.JobDescriptionTemplateService;
import com.sonkabin.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author sonkabin
 * @since 2019-04-04
 */
@RestController
public class JobDescriptionTemplateController {
    @Autowired
    private JobDescriptionTemplateService jobDescriptionTemplateService;

    @GetMapping("/jd")
    public Message getJDTemplate(@RequestParam("job") String job, @RequestParam("experience") String experience) {
        return jobDescriptionTemplateService.getJDTemplate(job, experience);
    }
}

