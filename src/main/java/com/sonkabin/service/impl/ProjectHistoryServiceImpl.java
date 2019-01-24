package com.sonkabin.service.impl;

import com.sonkabin.entity.ProjectHistory;
import com.sonkabin.mapper.ProjectHistoryMapper;
import com.sonkabin.service.ProjectHistoryService;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@Service
public class ProjectHistoryServiceImpl implements ProjectHistoryService {
    @Autowired
    private ProjectHistoryMapper ProjectHistoryMapper;
}
