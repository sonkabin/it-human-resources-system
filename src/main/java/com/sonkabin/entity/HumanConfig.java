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
 * @since 2019-01-24
 */
@TableName("tb_human_config")
public class HumanConfig implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 项目编号（外键）
     */
    private Integer projectId;

    /**
     * 员工编号（外键）
     */
    private Integer empId;

    /**
     * 此项目工作时间比例
     */
    private Integer portion = 0;

    /**
     * 项目状态
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

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public Integer getPortion() {
        return portion;
    }

    public void setPortion(Integer portion) {
        this.portion = portion;
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
        return "HumanConfig{" +
        "id=" + id +
        ", projectId=" + projectId +
        ", empId=" + empId +
        ", portion=" + portion +
        ", status=" + status +
        ", gmtCreate=" + gmtCreate +
        ", gmtModified=" + gmtModified +
        "}";
    }
}
