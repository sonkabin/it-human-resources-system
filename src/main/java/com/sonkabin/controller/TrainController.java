package com.sonkabin.controller;


import com.sonkabin.dto.TrainDTO;
import com.sonkabin.entity.Train;
import com.sonkabin.utils.Message;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;
import com.sonkabin.service.TrainService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@Controller
//@RequestMapping("/train")
public class TrainController {
    @Autowired
    private TrainService trainService;

    //--------------- 管理员开始 -------------------------
    @ResponseBody
    @GetMapping("/admin/trains")
    public Message getAllTrains (TrainDTO trainDTO) {
        return trainService.getAllTrains(trainDTO);
    }

    @ResponseBody
    @RequiresPermissions("train:add")
    @PostMapping("/admin/train")
    public Message saveTrain (Train train) {
        return trainService.saveTrain(train);
    }

    @ResponseBody
    @GetMapping("/admin/train/{id}")
    public Message getTrain (@PathVariable("id") Integer trainId) {
        return trainService.getTrain(trainId);
    }

    @ResponseBody
    @RequiresPermissions("train:update")
    @PutMapping("/admin/train/{id}")
    public Message updateTrain (Train train, @PathVariable("id") Integer trainId) {
        return trainService.updateTrain(train, trainId);
    }

    @ResponseBody
    @RequiresPermissions("train:update")
    @PutMapping("/admin/train/start/{id}")
    public Message startTrain (@PathVariable("id") Integer trainId) {
        return trainService.startTrain(trainId);
    }

    @ResponseBody
    @RequiresPermissions("train:update")
    @PutMapping("/admin/train/finish/{id}")
    public Message finishTrain (@PathVariable("id") Integer trainId) {
        return trainService.finishTrain(trainId);
    }

    @ResponseBody
    @RequiresPermissions("train:delete")
    @DeleteMapping("/admin/train/{id}")
    public Message deleteTrain (@PathVariable("id") Integer trainId) {
        return trainService.deleteTrain(trainId);
    }
    //--------------- 管理员结束 -------------------------

    //--------------- 员工开始 -------------------------
    @ResponseBody
    @GetMapping("/employee/trains")
    public Message getNotFinishedTrains (TrainDTO trainDTO) {
        return trainService.getNotFinishedTrains(trainDTO);
    }

    @ResponseBody
    @PutMapping("/employee/train/join/{id}")
    public Message joinTrain (@PathVariable("id") Integer trainId, @RequestParam("empName") String empName) {
        return trainService.joinTrain(trainId, empName);
    }

    @ResponseBody
    @PutMapping("/employee/train/quit/{id}")
    public Message quitTrain (@PathVariable("id") Integer trainId, @RequestParam("empName") String empName) {
        return trainService.quitTrain(trainId, empName);
    }

    @ResponseBody
    @GetMapping("/employee/trains/history")
    public Message getHistoryTrains (TrainDTO trainDTO) {
        return trainService.getHistoryTrains(trainDTO);
    }
}

