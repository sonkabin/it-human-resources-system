package com.sonkabin.service;

import com.sonkabin.dto.RecruitDTO;
import com.sonkabin.entity.Recruit;
import com.sonkabin.utils.Message;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-24
 */
public interface RecruitService{

    Message saveRecruit(Recruit recruit, MultipartFile resume) throws IOException;

    Message getRecruits(RecruitDTO recruitDTO, Integer jobId);

    Message acceptRecruit(Integer id);

    Message rejectRecruit(Integer id);

    Recruit getRecruitById(Integer id);

    Message getApplicantsReport();
}
