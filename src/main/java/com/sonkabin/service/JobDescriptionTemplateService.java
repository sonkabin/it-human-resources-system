package com.sonkabin.service;

import com.sonkabin.entity.JobDescriptionTemplate;
import com.sonkabin.utils.Message;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author sonkabin
 * @since 2019-04-04
 */
public interface JobDescriptionTemplateService{

    Message getJDTemplate(String job, String experience);
}
