package com.sonkabin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sonkabin.dto.ProjectDTO;
import com.sonkabin.entity.Project;
import com.sonkabin.mapper.ProjectMapper;
import com.sonkabin.service.ProjectService;
import com.sonkabin.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@Service
public class ProjectServiceImpl implements ProjectService {
    @Autowired
    private ProjectMapper projectMapper;

    @Override
    public Message getProjects(ProjectDTO projectDTO) {
        Page<Project> page = new Page<>();
        page.setSize(projectDTO.getRows());
        page.setCurrent(projectDTO.getPage());
        LambdaQueryWrapper<Project> wrapper = new LambdaQueryWrapper<>();
        if (projectDTO.getStatus() != -1) {
            wrapper.eq(Project::getStatus, projectDTO.getStatus());
        }
        IPage<Project> result = projectMapper.selectPage(page, wrapper);
        Message msg = Message.success().put("total", result.getTotal());
        msg.put("rows", result.getRecords());
        return msg;
    }
}
