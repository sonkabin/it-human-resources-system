package com.sonkabin.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sonkabin.dto.DemandDTO;
import com.sonkabin.entity.Employee;
import com.sonkabin.entity.TrainDemand;
import com.sonkabin.mapper.TrainDemandMapper;
import com.sonkabin.service.TrainDemandService;
import com.sonkabin.utils.Message;
import com.sonkabin.utils.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author sonkabin
 * @since 2019-02-23
 */
@Service
public class TrainDemandServiceImpl implements TrainDemandService {
    @Autowired
    private TrainDemandMapper trainDemandMapper;

    @Override
    public Message getAllDemands(DemandDTO demandDTO) {
        LambdaQueryWrapper<TrainDemand> wrapper = new LambdaQueryWrapper<>();
        wrapper.orderByDesc(TrainDemand::getGmtCreate, TrainDemand::getGmtModified);
        IPage<TrainDemand> result = selectPage(demandDTO, wrapper);
        return Message.success().put("total", result.getTotal()).put("rows", result.getRecords());
    }

    @Override
    public Message getDemands(DemandDTO demandDTO) {
        Employee loginEmp = MyUtil.getSessionEmployee("loginEmp");
        LambdaQueryWrapper<TrainDemand> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(TrainDemand::getEmpId, loginEmp.getId());
        wrapper.orderByDesc(TrainDemand::getGmtCreate, TrainDemand::getGmtModified);
        IPage<TrainDemand> result = selectPage(demandDTO, wrapper);
        return Message.success().put("total", result.getTotal()).put("rows", result.getRecords());
    }

    private IPage<TrainDemand> selectPage(DemandDTO demandDTO, Wrapper<TrainDemand> wrapper) {
        Page<TrainDemand> page = new Page<>();
        page.setSize(demandDTO.getRows());
        page.setCurrent(demandDTO.getPage());
        return trainDemandMapper.selectPage(page, wrapper);
    }

    @Override
    public Message saveDemand(TrainDemand demand) {
        Employee loginEmp = MyUtil.getSessionEmployee("loginEmp");
        LocalDateTime now = LocalDateTime.now();
        demand.setGmtCreate(now);
        demand.setGmtModified(now);
        demand.setEmpId(loginEmp.getId());
        demand.setEmpName(loginEmp.getEmpName());
        trainDemandMapper.insert(demand);
        return Message.success();
    }

    @Override
    public Message getDemand(Integer id) {
        TrainDemand demand = trainDemandMapper.selectById(id);
        return Message.success().put("demand", demand);
    }

    @Override
    public Message updateDemand(TrainDemand demand, Integer id) {
        demand.setId(id);
        demand.setGmtModified(LocalDateTime.now());
        trainDemandMapper.updateById(demand);
        return Message.success();
    }

    @Override
    public Message deleteDemand(Integer id) {
        trainDemandMapper.deleteById(id);
        return Message.success();
    }

}
