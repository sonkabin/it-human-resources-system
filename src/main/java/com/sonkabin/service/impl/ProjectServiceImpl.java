package com.sonkabin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sonkabin.dto.ProjectDTO;
import com.sonkabin.dto.ProjectHistoryDTO;
import com.sonkabin.entity.Employee;
import com.sonkabin.entity.HumanConfig;
import com.sonkabin.entity.Project;
import com.sonkabin.entity.ProjectHistory;
import com.sonkabin.mapper.HumanConfigMapper;
import com.sonkabin.mapper.ProjectHistoryMapper;
import com.sonkabin.mapper.ProjectMapper;
import com.sonkabin.service.ProjectService;
import com.sonkabin.utils.Message;
import com.sonkabin.utils.MyUtil;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@Service
public class ProjectServiceImpl implements ProjectService {
    @Autowired
    private ProjectMapper projectMapper;
    @Autowired
    private ProjectHistoryMapper projectHistoryMapper;
    @Autowired
    private HumanConfigMapper humanConfigMapper;

    @Override
    public Message getProjects(ProjectDTO projectDTO) {
        Page<Project> page = new Page<>();
        page.setSize(projectDTO.getRows());
        page.setCurrent(projectDTO.getPage());
        LambdaQueryWrapper<Project> wrapper = new LambdaQueryWrapper<>();
        if (projectDTO.getStatus() != -1) {
            wrapper.eq(Project::getStatus, projectDTO.getStatus());
        }
        Employee employee = (Employee) SecurityUtils.getSubject().getSession().getAttribute("loginEmp");
        // 获取某个项目经理的项目，而不是所有项目
        wrapper.eq(Project::getManagerId, employee.getId());
        IPage<Project> result = projectMapper.selectPage(page, wrapper);
        return Message.success().put("total", result.getTotal()).put("rows", result.getRecords());
    }

    @Override
    public Message saveProject(Project project) {
        project.setStatus(0);
        project.setGmtCreate(LocalDateTime.now());
        project.setGmtModified(LocalDateTime.now());
        Employee employee = MyUtil.getSessionEmployee("loginEmp");
        project.setManagerId(employee.getId());
        projectMapper.insert(project);
        return Message.success();
    }

    @Override
    public Message getHumanDetailByProjectId(Integer id) {
        Project project = projectMapper.selectById(id);
        LambdaQueryWrapper<ProjectHistory> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(ProjectHistory::getProjectId, id);
        List<ProjectHistory> histories = projectHistoryMapper.selectList(wrapper);
        return Message.success().put("project", project).put("humans", histories);
    }

    @Override
    public Message deleteProject(Integer projectId) {
        projectMapper.deleteById(projectId);
        return Message.success();
    }

    @Override
    public Message getProjectInformation(Integer id) {
        Project project = projectMapper.selectById(id);
        return Message.success().put("project", project);
    }

    @Override
    public Message updateProjectInformation(Integer id, Project project) {
        project.setId(id);
        project.setGmtModified(LocalDateTime.now());
        projectMapper.updateById(project);
        return Message.success();
    }

    @Transactional
    @Override
    public Message finishProject(Integer id) {
        LocalDateTime now = LocalDateTime.now();
        // 1.更新项目状态
        Project project = projectMapper.selectById(id);
        project.setStatus(2);
        project.setGmtModified(now);
        projectMapper.updateById(project);
        // 2.释放项目人力资源
        LambdaQueryWrapper<HumanConfig> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(HumanConfig::getProjectId, id).eq(HumanConfig::getStatus, 1); // 获得当前项目仍占用的人力资源
        List<HumanConfig> humanConfigs = humanConfigMapper.selectList(wrapper);
        HumanConfig config = new HumanConfig();
        config.setGmtModified(now);
        config.setStatus(2);
        humanConfigMapper.update(config, wrapper);
        // 3.排除已在贡献表中有的成员
        LambdaQueryWrapper<ProjectHistory> projectHistoryLambdaQueryWrapper = new LambdaQueryWrapper<>();
        projectHistoryLambdaQueryWrapper.eq(ProjectHistory::getProjectId, project.getId());
        List<ProjectHistory> projectHistories = projectHistoryMapper.selectList(projectHistoryLambdaQueryWrapper);
        Iterator<HumanConfig> iterator = humanConfigs.iterator();
        while (iterator.hasNext()) {
            HumanConfig humanConfig = iterator.next();
            for (ProjectHistory history : projectHistories) {
                if (humanConfig.getEmpId().compareTo(history.getEmpId())  == 0) {
                    iterator.remove();
                }
            }
        }
        // 4.插入成员贡献数据
        projectHistoryMapper.insertBatch(project, humanConfigs);
        return Message.success();
    }

    @Override
    public Message updateHumanContributeDetail(List<ProjectHistory> projectHistories) {
        projectHistoryMapper.updateBatch(projectHistories);
        return Message.success();
    }

    // ----------------- 员工开始     ---------------------------
    @Override
    public Message getInvolveProjects() {
        Employee employee = MyUtil.getSessionEmployee("loginEmp");
        LambdaQueryWrapper<HumanConfig> humanConfigLambdaQueryWrapper = new LambdaQueryWrapper<>();
        humanConfigLambdaQueryWrapper.eq(HumanConfig::getEmpId, employee.getId()).eq(HumanConfig::getStatus, 1);
        List<HumanConfig> humanConfigs = humanConfigMapper.selectList(humanConfigLambdaQueryWrapper);
        List<Integer> ids = new LinkedList<>();
        humanConfigs.forEach( h -> {
            ids.add(h.getProjectId());
        });
        LambdaQueryWrapper<Project> projectLambdaQueryWrapper = new LambdaQueryWrapper<>();
        projectLambdaQueryWrapper.in(Project::getId, ids);
        List<Project> projects = projectMapper.selectList(projectLambdaQueryWrapper);
        return Message.success().put("humanConfigs", humanConfigs).put("projects", projects);
    }

    @Override
    public Message getHistoryProjects(ProjectHistoryDTO projectHistoryDTO) {
        Page<ProjectHistory> page = new Page<>();
        page.setSize(projectHistoryDTO.getRows());
        page.setCurrent(projectHistoryDTO.getPage());
        Employee employee = MyUtil.getSessionEmployee("loginEmp");
        LambdaQueryWrapper<ProjectHistory> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(ProjectHistory::getEmpId, employee.getId());
        //todo  需要只比较日期，不比较时间
        wrapper.ge(projectHistoryDTO.getStartDate() != null, ProjectHistory::getGmtCreate, projectHistoryDTO.getStartDate());
        wrapper.le(projectHistoryDTO.getEndDate() != null, ProjectHistory::getGmtModified, projectHistoryDTO.getEndDate().plusDays(1));
        IPage<ProjectHistory> result = projectHistoryMapper.selectPage(page, wrapper);
        return Message.success().put("total", result.getTotal()).put("rows", result.getRecords());
    }
}
