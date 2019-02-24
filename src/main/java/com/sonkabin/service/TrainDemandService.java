package com.sonkabin.service;

import com.sonkabin.dto.DemandDTO;
import com.sonkabin.entity.TrainDemand;
import com.sonkabin.utils.Message;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author sonkabin
 * @since 2019-02-23
 */
public interface TrainDemandService{

    Message getAllDemands(DemandDTO demandDTO);

    Message getDemands(DemandDTO demandDTO);

    Message saveDemand(TrainDemand demand);

    Message getDemand(Integer id);

    Message updateDemand(TrainDemand demand, Integer id);

    Message deleteDemand(Integer id);
}
