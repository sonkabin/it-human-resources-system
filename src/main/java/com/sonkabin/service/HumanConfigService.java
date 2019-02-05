package com.sonkabin.service;

import com.sonkabin.entity.HumanConfig;
import com.sonkabin.utils.Message;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-24
 */
public interface HumanConfigService{

    Message saveConfig(List<HumanConfig> configs);

    Message getHumanConfigs(Integer projectId);

    Message releaseHuman(HumanConfig config, String contribute);

    Message getOtherEmployees(Integer projectId);

    Message requireHuman(List<HumanConfig> configs);
}
