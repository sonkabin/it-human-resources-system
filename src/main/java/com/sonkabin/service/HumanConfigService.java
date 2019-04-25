package com.sonkabin.service;

import com.sonkabin.dto.RecalculateDTO;
import com.sonkabin.entity.HumanConfig;
import com.sonkabin.utils.Message;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-24
 */
public interface HumanConfigService{

    Message startProject(List<HumanConfig> configs);

    Message saveConfig(List<HumanConfig> configs, LocalDate endDate);

    Message getHumanConfigs(Integer projectId, boolean flag);

    Message releaseHuman(HumanConfig config, String contribute);

    Message getOtherEmployees(Integer projectId);

    Message requireHuman(List<HumanConfig> configs);

    Message recalculate(RecalculateDTO recalculateDTO);

    Message calculateHumans(Integer projectId);

    Message getInvolveProjects(Integer empId);

    Set<HumanConfig> getAlterationHumanConfigRecords(Integer projectId);
}
