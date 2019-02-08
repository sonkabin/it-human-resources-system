package com.sonkabin.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import java.time.LocalDate;
import com.baomidou.mybatisplus.annotation.TableId;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.io.Serializable;

/**
 * <p>
 *
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@TableName("tb_project")
public class Project implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private String projectName;

    /**
     * 项目背景
     */
    private String background;

    private String frontEndSkill;

    private Integer frontEndNum;

    private String backEndSkill;

    private Integer backEndNum;

    private String dbSkill;

    private Integer dbNum;

    /**
     * 项目经理id
     */
    private Integer managerId;

    private String managerName;

    /**
     * 0表示未启动，1表示进行中，2表示已结束
     */
    private Integer status;

    /**
     * 预计开始时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate predictStart;

    /**
     * 开始时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate startDate;

    /**
     * 预计结束时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate predictEnd;

    private LocalDateTime gmtCreate;

    private LocalDateTime gmtModified;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getBackground() {
        return background;
    }

    public void setBackground(String background) {
        this.background = background;
    }

    public String getFrontEndSkill() {
        return frontEndSkill;
    }

    public void setFrontEndSkill(String frontEndSkill) {
        this.frontEndSkill = frontEndSkill;
    }

    public Integer getFrontEndNum() {
        return frontEndNum;
    }

    public void setFrontEndNum(Integer frontEndNum) {
        this.frontEndNum = frontEndNum;
    }

    public String getBackEndSkill() {
        return backEndSkill;
    }

    public void setBackEndSkill(String backEndSkill) {
        this.backEndSkill = backEndSkill;
    }

    public Integer getBackEndNum() {
        return backEndNum;
    }

    public void setBackEndNum(Integer backEndNum) {
        this.backEndNum = backEndNum;
    }

    public String getDbSkill() {
        return dbSkill;
    }

    public void setDbSkill(String dbSkill) {
        this.dbSkill = dbSkill;
    }

    public Integer getDbNum() {
        return dbNum;
    }

    public void setDbNum(Integer dbNum) {
        this.dbNum = dbNum;
    }

    public Integer getManagerId() {
        return managerId;
    }

    public void setManagerId(Integer managerId) {
        this.managerId = managerId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public LocalDate getPredictStart() {
        return predictStart;
    }

    public void setPredictStart(LocalDate predictStart) {
        this.predictStart = predictStart;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getPredictEnd() {
        return predictEnd;
    }

    public void setPredictEnd(LocalDate predictEnd) {
        this.predictEnd = predictEnd;
    }

    public LocalDateTime getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(LocalDateTime gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public LocalDateTime getGmtModified() {
        return gmtModified;
    }

    public void setGmtModified(LocalDateTime gmtModified) {
        this.gmtModified = gmtModified;
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    @Override
    public String toString() {
        return "Project{" +
                "id=" + id +
                ", projectName='" + projectName + '\'' +
                ", background='" + background + '\'' +
                ", frontEndSkill='" + frontEndSkill + '\'' +
                ", frontEndNum=" + frontEndNum +
                ", backEndSkill='" + backEndSkill + '\'' +
                ", backEndNum=" + backEndNum +
                ", dbSkill='" + dbSkill + '\'' +
                ", dbNum=" + dbNum +
                ", managerId=" + managerId +
                ", managerName='" + managerName + '\'' +
                ", status=" + status +
                ", predictStart=" + predictStart +
                ", startDate=" + startDate +
                ", predictEnd=" + predictEnd +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                '}';
    }
}
