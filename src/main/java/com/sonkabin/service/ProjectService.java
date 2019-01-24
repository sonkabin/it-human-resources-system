package com.sonkabin.service;

import com.sonkabin.dto.ProjectDTO;
import com.sonkabin.entity.Project;
import com.sonkabin.utils.Message;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-24
 */
public interface ProjectService{

 Message getProjects(ProjectDTO projectDTO);
}
