package com.sonkabin.controller;


import com.sonkabin.dto.TrainDTO;
import com.sonkabin.entity.Train;
import com.sonkabin.utils.Message;
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

    @ResponseBody
    @GetMapping("/admin/trains")
    public Message getAllTrains (TrainDTO trainDTO) {
        return trainService.getAllTrains(trainDTO);
    }

    @ResponseBody
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
    @PutMapping("/admin/train/{id}")
    public Message updateTrain (Train train, @PathVariable("id") Integer trainId) {
        return trainService.updateTrain(train, trainId);
    }

    @ResponseBody
    @PutMapping("/admin/train/start/{id}")
    public Message startTrain (@PathVariable("id") Integer trainId) {
        return trainService.startTrain(trainId);
    }

    @ResponseBody
    @PutMapping("/admin/train/finish/{id}")
    public Message finishTrain (@PathVariable("id") Integer trainId) {
        return trainService.finishTrain(trainId);
    }

    @ResponseBody
    @DeleteMapping("/admin/train/{id}")
    public Message deleteTrain (@PathVariable("id") Integer trainId) {
        return trainService.deleteTrain(trainId);
    }


}

