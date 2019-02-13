package com.sonkabin.dto;

public class JobDTO {
    private long rows;
    private long page;
    private String career;
    private Integer status;

    public long getRows() {
        return rows;
    }

    public void setRows(long rows) {
        this.rows = rows;
    }

    public long getPage() {
        return page;
    }

    public void setPage(long page) {
        this.page = page;
    }

    public String getCareer() {
        return career;
    }

    public void setCareer(String career) {
        this.career = career;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
