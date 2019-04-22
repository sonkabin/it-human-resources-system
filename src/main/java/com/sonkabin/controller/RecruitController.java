package com.sonkabin.controller;


import com.sonkabin.dto.RecruitDTO;
import com.sonkabin.entity.Recruit;
import com.sonkabin.service.RecruitService;
import com.sonkabin.utils.Message;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@Controller
public class RecruitController {
    @Autowired
    private RecruitService recruitService;

    @ResponseBody
    @PostMapping("/anon/recruit")
    public Message saveRecruit (Recruit recruit, @RequestParam("resume") MultipartFile resume) throws IOException {
        return recruitService.saveRecruit(recruit, resume);
    }

    @ResponseBody
    @GetMapping("/recruits/{jobId}")
    public Message getRecruits (RecruitDTO recruitDTO, @PathVariable("jobId") Integer jobId) {
        return recruitService.getRecruits(recruitDTO, jobId);
    }

    @ResponseBody
    @PutMapping("/recruit/accept/{id}")
    public Message acceptRecruit (@PathVariable("id") Integer id) {
        return recruitService.acceptRecruit(id);
    }
    @ResponseBody
    @PutMapping("/recruit/reject/{id}")
    public Message rejectRecruit (@PathVariable("id") Integer id) {
        return recruitService.rejectRecruit(id);
    }

    @ResponseBody
    @GetMapping("/download/{id}")
    public ResponseEntity<byte[]> download (@PathVariable("id") Integer id) throws IOException {
        Recruit recruit = recruitService.getRecruitById(id);
        String resumePath = recruit.getResumePath();
        String[] split = resumePath.split("/");
        File file = new File(resumePath);
        // 处理显示中文文件名的问题
        String fileName = new String(split[split.length - 1].getBytes("utf-8"),"ISO-8859-1");
        // 设置请求头内容,告诉浏览器代开下载窗口
        HttpHeaders headers = new HttpHeaders();
        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
        return responseEntity;
    }

    // todo 报表
    @ResponseBody
    @GetMapping("/applicants/report")
    public Message getApplicantsReport () {
        return recruitService.getApplicantsReport();
    }
}

