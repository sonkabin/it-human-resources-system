package com.sonkabin.service;

import com.sonkabin.dto.TrainDTO;
import com.sonkabin.entity.Train;
import com.sonkabin.utils.Message;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-24
 */
public interface TrainService{

    Message getAllTrains(TrainDTO trainDTO);

    Message saveTrain(Train train);

    Message deleteTrain(Integer trainId);

    Message updateTrain(Train train, Integer trainId);

    Message getTrain(Integer trainId);

    Message startTrain(Integer trainId);

    Message finishTrain(Integer trainId);
}
