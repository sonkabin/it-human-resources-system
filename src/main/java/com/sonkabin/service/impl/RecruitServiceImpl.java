package com.sonkabin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sonkabin.dto.RecruitDTO;
import com.sonkabin.entity.Employee;
import com.sonkabin.entity.Recruit;
import com.sonkabin.mapper.RecruitMapper;
import com.sonkabin.service.RecruitService;
import com.sonkabin.utils.Message;
import com.sonkabin.utils.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDateTime;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@Service
public class RecruitServiceImpl implements RecruitService {
    @Autowired
    private RecruitMapper recruitMapper;

    private static final String RESUME_PREFIX = "G:/static/resumes/resume";

    @Override
    public Message saveRecruit(Recruit recruit, MultipartFile resume) throws IOException {
        Integer count = recruitMapper.selectCount(null);
        String[] split = resume.getOriginalFilename().split("\\."); // 获取文件后缀名
        StringBuilder fileName = new StringBuilder();
        fileName.append(count);
        fileName.append(".");
        fileName.append(split[split.length - 1]); // 拼接带后缀的文件名
        String resumePath = RESUME_PREFIX + fileName;
        try (BufferedOutputStream outputStream = new BufferedOutputStream(new FileOutputStream(resumePath))) {
            outputStream.write(resume.getBytes());//上传
            outputStream.flush();
        }
        recruit.setResumePath(resumePath);
        LocalDateTime now = LocalDateTime.now();
        recruit.setGmtCreate(now);
        recruit.setGmtModified(now);
        recruit.setStatus(0);
        recruitMapper.insert(recruit);
        return Message.success();
    }

    @Override
    public Message getRecruits(RecruitDTO recruitDTO, Integer jobId) {
        Page<Recruit> page = new Page<>();
        page.setSize(recruitDTO.getRows());
        page.setCurrent(recruitDTO.getPage());
        LambdaQueryWrapper<Recruit> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(recruitDTO.getStatus() != -1, Recruit::getStatus, recruitDTO.getStatus());
        wrapper.eq(Recruit::getJobId, jobId);
        IPage<Recruit> result = recruitMapper.selectPage(page, wrapper);
        return Message.success().put("total", result.getTotal()).put("rows", result.getRecords());
    }

    @Override
    public Message acceptRecruit(Integer id) {
        Recruit recruit = processRecruit(id);
        recruit.setStatus(1);
        recruitMapper.updateById(recruit);
        return Message.success();
    }

    @Override
    public Message rejectRecruit(Integer id) {
        Recruit recruit = processRecruit(id);
        recruit.setStatus(2);
        recruitMapper.updateById(recruit);
        return Message.success();
    }

    private Recruit processRecruit (Integer id) {
        Employee loginEmp = MyUtil.getSessionEmployee("loginEmp");
        Recruit recruit = new Recruit();
        recruit.setId(id);
        recruit.setGmtModified(LocalDateTime.now());
        recruit.setEmpId(loginEmp.getId());
        recruit.setEmpName(loginEmp.getEmpName());
        return recruit;
    }

    @Override
    public Recruit getRecruitById(Integer id) {
        return recruitMapper.selectById(id);
    }

    @Override
    public Message getApplicantsReport() {
        return Message.success();
    }
}
