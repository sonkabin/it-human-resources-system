package com.sonkabin.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@TableName("tb_report")
public class Report implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private Integer reportProject;

    private Float avgWorkTime;

    private Float avgProject;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getReportProject() {
        return reportProject;
    }

    public void setReportProject(Integer reportProject) {
        this.reportProject = reportProject;
    }

    public Float getAvgWorkTime() {
        return avgWorkTime;
    }

    public void setAvgWorkTime(Float avgWorkTime) {
        this.avgWorkTime = avgWorkTime;
    }

    public Float getAvgProject() {
        return avgProject;
    }

    public void setAvgProject(Float avgProject) {
        this.avgProject = avgProject;
    }

    @Override
    public String toString() {
        return "Report{" +
        "id=" + id +
        ", reportProject=" + reportProject +
        ", avgWorkTime=" + avgWorkTime +
        ", avgProject=" + avgProject +
        "}";
    }
}
