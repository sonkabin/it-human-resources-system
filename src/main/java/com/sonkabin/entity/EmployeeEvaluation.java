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
 * @since 2019-05-06
 */
@TableName("tb_employee_evaluation")
public class EmployeeEvaluation implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private Integer empId;

    private String empName;

    private Integer projectId;

    private Integer totalScore;

    private Integer totalNum;

    /**
     * 项目经理给的评分，权重0.6，其他员工权重0.4
     */
    private Integer managerScore;

    /**
     * 0表示未评价，1表示已对其他人评价
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

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public Integer getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(Integer totalScore) {
        this.totalScore = totalScore;
    }

    public Integer getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(Integer totalNum) {
        this.totalNum = totalNum;
    }

    public Integer getManagerScore() {
        return managerScore;
    }

    public void setManagerScore(Integer managerScore) {
        this.managerScore = managerScore;
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
        return "EmployeeEvaluation{" +
                "id=" + id +
                ", empId=" + empId +
                ", empName='" + empName + '\'' +
                ", projectId=" + projectId +
                ", totalScore=" + totalScore +
                ", totalNum=" + totalNum +
                ", managerScore=" + managerScore +
                ", status=" + status +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                '}';
    }
}
