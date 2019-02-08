package com.sonkabin.mapper;

import com.sonkabin.entity.HumanConfig;
import com.sonkabin.entity.Project;
import com.sonkabin.entity.ProjectHistory;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-24
 */
public interface ProjectHistoryMapper extends BaseMapper<ProjectHistory> {

    void insertBatch(@Param("project") Project project, @Param("humanConfigs") List<HumanConfig> humanConfigs);

    void updateBatch(@Param("list") List<ProjectHistory> projectHistories);
}
