package com.sonkabin.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;

/**
 * <p>
 *
 * </p>
 *
 * @author sonkabin
 * @since 2019-02-13
 */
@TableName("tb_job")
public class Job implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 招聘职位
     */
    private String career;

    /**
     * 招聘人数
     */
    private Integer num;

    /**
     * 学历要求
     */
    private String eduBackground;

    /**
     * 工作经验
     */
    private String experience;

    /**
     * 薪资
     */
    private String salary;

    /**
     * 岗位职责
     */
    private String responsibility;

    /**
     * 任职要求
     */
    private String demand;

    /**
     * 招聘状态，0表示未结束，1表示已结束
     */
    private Integer status;

    private LocalDateTime gmtCreate;

    private LocalDateTime gmtModified;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCareer() {
        return career;
    }

    public void setCareer(String career) {
        this.career = career;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getEduBackground() {
        return eduBackground;
    }

    public void setEduBackground(String eduBackground) {
        this.eduBackground = eduBackground;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getResponsibility() {
        return responsibility;
    }

    public void setResponsibility(String responsibility) {
        this.responsibility = responsibility;
    }

    public String getDemand() {
        return demand;
    }

    public void setDemand(String demand) {
        this.demand = demand;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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

    @Override
    public String toString() {
        return "Job{" +
        "id=" + id +
        ", career=" + career +
        ", num=" + num +
        ", eduBackground=" + eduBackground +
        ", experience=" + experience +
        ", salary=" + salary +
        ", responsibility=" + responsibility +
        ", demand=" + demand +
        ", gmtCreate=" + gmtCreate +
        ", gmtModified=" + gmtModified +
        "}";
    }
}
