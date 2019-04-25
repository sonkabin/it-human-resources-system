package com.sonkabin.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig {
    @Bean
    public WebMvcConfigurer webMvcConfigurer(){
        return new WebMvcConfigurer() {
            @Override
            public void addViewControllers(ViewControllerRegistry registry) {
                registry.addViewController("/").setViewName("login");
                registry.addViewController("/index.html").setViewName("login");
                // 使跳转到模板下面的login.html，因为在shiro中配置了规则
                registry.addViewController("/login.html").setViewName("login");

                // 管理员视图
                registry.addViewController("/admin.html").setViewName("admin/index");
                registry.addViewController("/admin-employee-manage.html").setViewName("admin/emp");
                registry.addViewController("/admin-permission-manage.html").setViewName("admin/permission");
                registry.addViewController("/admin-message-manage.html").setViewName("admin/message");
                registry.addViewController("/admin-account-manage.html").setViewName("admin/account");

                // HR视图
                registry.addViewController("/hr.html").setViewName("hr/index");
                registry.addViewController("/hr-employee-manage.html").setViewName("hr/emp");
                registry.addViewController("/hr-project-manage.html").setViewName("hr/project");
                registry.addViewController("/hr-train-manage.html").setViewName("hr/train");
                registry.addViewController("/hr-recruit-manage.html").setViewName("hr/recruit");
                registry.addViewController("/hr-question-manage.html").setViewName("hr/question");
                registry.addViewController("/hr-account-manage.html").setViewName("hr/account");

                // 员工视图
                registry.addViewController("/employee.html").setViewName("employee/index");
//                registry.addViewController("/personManage.html").setViewName("employee/personManage");
//                registry.addViewController("/skillManage.html").setViewName("employee/skillManage");
                registry.addViewController("/careerManage.html").setViewName("employee/careerManage");
                registry.addViewController("/accountManage.html").setViewName("employee/accountManage");
                registry.addViewController("/empTrainManage.html").setViewName("employee/trainManage");
                registry.addViewController("/demandManage.html").setViewName("employee/demandManage");
                registry.addViewController("/projectInformation.html").setViewName("employee/projectInformation");
                registry.addViewController("/project.html").setViewName("employee/manager/project");
                registry.addViewController("/messageManage.html").setViewName("employee/messageManage");
            }
        };
    }
}
