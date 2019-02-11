package com.sonkabin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sonkabin.dto.TrainDTO;
import com.sonkabin.entity.Train;
import com.sonkabin.mapper.TrainMapper;
import com.sonkabin.service.TrainService;
import com.sonkabin.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@Service
public class TrainServiceImpl implements TrainService {
    @Autowired
    private TrainMapper trainMapper;

    @Override
    public Message getAllTrains(TrainDTO trainDTO) {
        Page<Train> page = new Page<>();
        page.setSize(trainDTO.getRows());
        page.setCurrent(trainDTO.getPage());
        LambdaQueryWrapper<Train> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(!StringUtils.isEmpty(trainDTO.getTrainName()), Train::getName, trainDTO.getTrainName());
        IPage<Train> result = trainMapper.selectPage(page, wrapper);
        return Message.success().put("total", result.getTotal()).put("rows", result.getRecords());
    }

    @Override
    public Message saveTrain(Train train) {
        LocalDateTime now = LocalDateTime.now();
        train.setGmtCreate(now);
        train.setGmtModified(now);
        trainMapper.insert(train);
        return Message.success();
    }

    @Override
    public Message deleteTrain(Integer trainId) {
        trainMapper.deleteById(trainId);
        return Message.success();
    }

    @Override
    public Message updateTrain(Train train, Integer trainId) {
        train.setId(trainId);
        train.setGmtModified(LocalDateTime.now());
        trainMapper.updateById(train);
        return Message.success();
    }

    @Override
    public Message getTrain(Integer trainId) {
        Train train = trainMapper.selectById(trainId);
        return Message.success().put("train", train);
    }

    @Override
    public Message startTrain(Integer trainId) {
        updateStatus(trainId, 1);
        return Message.success();
    }

    @Override
    public Message finishTrain(Integer trainId) {
        updateStatus(trainId, 2);
        return Message.success();
    }

    private void updateStatus (Integer trainId, Integer status) {
        LambdaQueryWrapper<Train> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Train::getId, trainId);
        Train train = new Train();
        train.setStatus(status);
        train.setGmtModified(LocalDateTime.now());
        trainMapper.update(train , wrapper);
    }

}
