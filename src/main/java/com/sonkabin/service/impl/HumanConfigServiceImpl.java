package com.sonkabin.service.impl;

import com.sonkabin.entity.HumanConfig;
import com.sonkabin.entity.Project;
import com.sonkabin.mapper.HumanConfigMapper;
import com.sonkabin.mapper.ProjectMapper;
import com.sonkabin.service.HumanConfigService;
import com.sonkabin.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@Service
public class HumanConfigServiceImpl implements HumanConfigService {
    @Autowired
    private HumanConfigMapper humanConfigMapper;
    @Autowired
    private ProjectMapper projectMapper;

    @Transactional
    @Override
    public Message saveConfig(List<HumanConfig> configs) {
        configs.forEach((config) -> {
            config.setStatus(1);
            config.setGmtCreate(LocalDateTime.now());
            config.setGmtModified(LocalDateTime.now());
        });
        humanConfigMapper.insertBatch(configs);
        Integer projectId = configs.get(0).getProjectId();
        Project project = new Project();
        project.setId(projectId);
        project.setStatus(1);
        project.setGmtModified(LocalDateTime.now());
        project.setStartDate(LocalDate.now());
        projectMapper.updateById(project);
        return Message.success();
    }
}
