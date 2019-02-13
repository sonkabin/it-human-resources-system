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
                registry.addViewController("/admin.html").setViewName("admin/index");
                registry.addViewController("/manageEmp.html").setViewName("admin/emp");
                registry.addViewController("/manageTrain.html").setViewName("admin/train");
                registry.addViewController("/manageRecruit.html").setViewName("admin/recruit");

                // 员工视图
                registry.addViewController("/employee.html").setViewName("employee/index");
//                registry.addViewController("/personManage.html").setViewName("employee/personManage");
//                registry.addViewController("/skillManage.html").setViewName("employee/skillManage");
                registry.addViewController("/careerManage.html").setViewName("employee/careerManage");
                registry.addViewController("/accountManage.html").setViewName("employee/accountManage");
                registry.addViewController("/empTrainManage.html").setViewName("employee/trainManage");
                registry.addViewController("/projectInformation.html").setViewName("employee/projectInformation");
                registry.addViewController("/project.html").setViewName("employee/manager/project");
                registry.addViewController("/messageManage.html").setViewName("employee/messageManage");
            }
        };
    }
}
