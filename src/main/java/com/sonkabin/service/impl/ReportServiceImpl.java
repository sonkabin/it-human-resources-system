package com.sonkabin.service.impl;

import com.sonkabin.entity.Report;
import com.sonkabin.mapper.ReportMapper;
import com.sonkabin.service.ReportService;
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
public class ReportServiceImpl implements ReportService {
    @Autowired
    private ReportMapper ReportMapper;
}
