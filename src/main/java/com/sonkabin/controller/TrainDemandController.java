package com.sonkabin.controller;


import com.sonkabin.dto.DemandDTO;
import com.sonkabin.entity.TrainDemand;
import com.sonkabin.service.TrainDemandService;
import com.sonkabin.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 *
 * @author sonkabin
 * @since 2019-02-23
 */
@RestController
public class TrainDemandController {
    @Autowired
    private TrainDemandService trainDemandService;

    @GetMapping("/admin/demands")
    public Message getAllDemands(DemandDTO demandDTO) {
        return trainDemandService.getAllDemands(demandDTO);
    }

    //----------------- 员工开始 -----------------
    @GetMapping("/employee/demands")
    public Message getDemands(DemandDTO demandDTO) {
        return trainDemandService.getDemands(demandDTO);
    }

    @PostMapping("/employee/demand")
    public Message saveDemand(TrainDemand demand) {
        return trainDemandService.saveDemand(demand);
    }

    @GetMapping("/employee/demand/{id}")
    public Message getDemand(@PathVariable("id") Integer id) {
        return trainDemandService.getDemand(id);
    }

    @PutMapping("/employee/demand/{id}")
    public Message updateDemand(TrainDemand demand, @PathVariable("id") Integer id) {
        return trainDemandService.updateDemand(demand, id);
    }

    @DeleteMapping("/employee/demand/{id}")
    public Message deleteDemand(@PathVariable("id") Integer id) {
        return trainDemandService.deleteDemand(id);
    }
}

