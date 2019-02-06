package com.sonkabin.dto;

import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

public class RecalculateDTO {

    private Integer projectId;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate endDate;

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }
}
