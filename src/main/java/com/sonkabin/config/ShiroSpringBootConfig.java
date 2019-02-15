package com.sonkabin.config;

import com.sonkabin.realm.EmployeeRealm;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.spring.web.config.DefaultShiroFilterChainDefinition;
import org.apache.shiro.spring.web.config.ShiroFilterChainDefinition;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ShiroSpringBootConfig {

    @Bean
    public Realm realm(){
        EmployeeRealm employeeRealm = new EmployeeRealm();
        employeeRealm.setCredentialsMatcher(hashedCredentialsMatcher());
        return employeeRealm;
    }

    @Bean
    public HashedCredentialsMatcher hashedCredentialsMatcher(){
        HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
        hashedCredentialsMatcher.setHashAlgorithmName("MD5");
        hashedCredentialsMatcher.setHashIterations(1024);
        return hashedCredentialsMatcher;
    }

    @Bean
    public ShiroFilterChainDefinition shiroFilterChainDefinition() {
        DefaultShiroFilterChainDefinition chainDefinition = new DefaultShiroFilterChainDefinition();

        chainDefinition.addPathDefinition("/","anon");
        chainDefinition.addPathDefinition("/index.html","anon");
        chainDefinition.addPathDefinition("/recruit.html","anon");
        chainDefinition.addPathDefinition("/login.html","anon");
        chainDefinition.addPathDefinition("/custom/**", "anon");
        chainDefinition.addPathDefinition("/css/**", "anon");
        chainDefinition.addPathDefinition("/fonts/**", "anon");
        chainDefinition.addPathDefinition("/icons-reference/**", "anon");
        chainDefinition.addPathDefinition("/js/**", "anon");
        chainDefinition.addPathDefinition("/vendor/**", "anon");
        chainDefinition.addPathDefinition("/login", "anon");
        chainDefinition.addPathDefinition("/error", "anon");
        chainDefinition.addPathDefinition("/druid/**","anon");
        // 配置所有允许匿名访问的其他链接以anno开头
        chainDefinition.addPathDefinition("/anon/**","anon");
        chainDefinition.addPathDefinition("/logout", "logout");
        chainDefinition.addPathDefinition("/**", "authc");
        return chainDefinition;
    }
}
