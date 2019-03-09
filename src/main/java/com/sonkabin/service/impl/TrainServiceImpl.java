package com.sonkabin.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sonkabin.dto.TrainDTO;
import com.sonkabin.entity.Employee;
import com.sonkabin.entity.Train;
import com.sonkabin.mapper.TrainMapper;
import com.sonkabin.service.TrainService;
import com.sonkabin.utils.Message;
import com.sonkabin.utils.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

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
public class TrainServiceImpl implements TrainService {
    @Autowired
    private TrainMapper trainMapper;

    @Override
    public Message getAllTrains(TrainDTO trainDTO) {
        LambdaQueryWrapper<Train> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(!StringUtils.isEmpty(trainDTO.getTrainName()), Train::getName, trainDTO.getTrainName());
        IPage<Train> result = selectPage(trainDTO, wrapper);
        return Message.success().put("total", result.getTotal()).put("rows", result.getRecords());
    }

    @Override
    public Message saveTrain(Train train) {
        LocalDateTime now = LocalDateTime.now();
        train.setStatus(0);
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
        // 更新培训信息时应仍旧保存培训的员工信息
        train.setEmps(trainMapper.selectById(trainId).getEmps());
        train.setGmtModified(LocalDateTime.now());
        trainMapper.updateById(train);
        return Message.success();
    }

    @Override
    public Message getTrain(Integer trainId) {
        Train train = trainMapper.selectById(trainId);
        return Message.success().put("train", train);
    }

    private void updateStatus (Integer trainId, Integer status) {
        LambdaQueryWrapper<Train> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Train::getId, trainId);
        Train train = new Train();
        train.setStatus(status);
        train.setGmtModified(LocalDateTime.now());
        trainMapper.update(train , wrapper);
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

    @Override
    public Message getNotFinishedTrains(TrainDTO trainDTO) {
        LambdaQueryWrapper<Train> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(!StringUtils.isEmpty(trainDTO.getTrainName()), Train::getName, trainDTO.getTrainName());
        wrapper.ne(Train::getStatus, 2);
        IPage<Train> result = selectPage(trainDTO, wrapper);
       return Message.success().put("total", result.getTotal()).put("rows", result.getRecords());
    }

    private IPage<Train> selectPage (TrainDTO trainDTO, Wrapper<Train> wrapper) {
        Page<Train> page = new Page<>();
        page.setSize(trainDTO.getRows());
        page.setCurrent(trainDTO.getPage());
        return trainMapper.selectPage(page, wrapper);
    }

    @Override
    public Message joinTrain(Integer trainId, String empName) {
        Train train = trainMapper.selectById(trainId);
        train.setGmtModified(LocalDateTime.now());
        String emps = train.getEmps();
        if (StringUtils.isEmpty(emps)) {
            emps = empName;
        } else {
            emps = emps + ";" + empName;
        }
        train.setEmps(emps);
        trainMapper.updateById(train);
        return Message.success();
    }

    @Override
    public Message quitTrain(Integer trainId, String empName) {
        Train train = trainMapper.selectById(trainId);
        train.setGmtModified(LocalDateTime.now());
        String emps = train.getEmps();
        int index, len = empName.length();
        if ((index = emps.indexOf(";" + empName)) != -1 || (index = emps.indexOf(empName + ";")) != -1) {
            StringBuilder builder = new StringBuilder(emps.substring(0, index));
            builder.append(emps.substring(index + len + 1));
            emps = builder.toString();
        } else {
            // 有且仅有自己加入培训
            emps = "";
        }
        train.setEmps(emps);
        trainMapper.updateById(train);
        return Message.success();
    }

    @Override
    public Message getHistoryTrains(TrainDTO trainDTO) {
        LambdaQueryWrapper<Train> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Train::getStatus, 2); // 已完成的培训
        Employee loginEmp = MyUtil.getSessionEmployee("loginEmp");
        wrapper.like(Train::getEmps, loginEmp.getEmpName());
        wrapper.like(!StringUtils.isEmpty(trainDTO.getTrainName()), Train::getName, trainDTO.getTrainName());
        wrapper.orderBy(true, trainDTO.getSortOrder().equals("asc"), Train::getGmtCreate);
        IPage<Train> result = selectPage(trainDTO, wrapper);
        return Message.success().put("total", result.getTotal()).put("rows", result.getRecords());
    }


}
