package com.sonkabin.config;

import com.sonkabin.realm.EmployeeRealm;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.authc.LogoutFilter;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;

import javax.servlet.Filter;
import java.util.LinkedHashMap;
import java.util.Map;

@Configuration
public class ShiroConfig {

    /**
     * 配置SecurityManager
     */
    @Bean
    public SecurityManager securityManager(){
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        /*
        由于userRealm()方法上添加了@Bean注解，Spring会拦截所有对它的调用，
        确保直接返回该方法创建的bean，而不是进行实际的调用
         */
        securityManager.setRealm(employeeRealm());
        return securityManager;
    }

    @Bean
    public EmployeeRealm employeeRealm(){
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
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor(){
        return new LifecycleBeanPostProcessor();
    }

    @Bean(name = "shiroFilter")
    public ShiroFilterFactoryBean shiroFilterFactoryBean(){
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager());

        Map<String, Filter> filters = new LinkedHashMap<>();
        //可添加filter，但是官网中有这么一句话
        /*
        因为filter类的bean在chain definitions通过它的beanName能自动被获得，所有'filters' 没有必要了，
        但是你能给它们起别名
         */
        shiroFilterFactoryBean.setFilters(filters);
        shiroFilterFactoryBean.setLoginUrl("/login.html");

        //使用LinkedHashMap，因为使用了FIRST MATCH WINS
        Map<String,String> filterChainDefinitions = new LinkedHashMap<>();
        filterChainDefinitions.put("/","anon");
        filterChainDefinitions.put("/index.html","anon");
        filterChainDefinitions.put("/login.html","anon");
        filterChainDefinitions.put("/custom/**", "anon");
        filterChainDefinitions.put("/css/**", "anon");
        filterChainDefinitions.put("/fonts/**", "anon");
        filterChainDefinitions.put("/icons-reference/**", "anon");
        filterChainDefinitions.put("/js/**", "anon");
        filterChainDefinitions.put("/vendor/**", "anon");
        filterChainDefinitions.put("/login", "anon");
        filterChainDefinitions.put("/error", "anon");
        filterChainDefinitions.put("/druid/**","anon"); // 放行druid
        filterChainDefinitions.put("/logout", "logout");
        //  /**表示任何请求/以及其子路径的都会触发filter chain
        filterChainDefinitions.put("/**", "authc");
        //要放入ShiroFilterFactoryBean才行
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitions);
        return shiroFilterFactoryBean;
    }

    /*
    DefaultAdvisorAutoProxyCreator和 AuthorizationAttributeSourceAdvisor
    启动Shiro注解（如@RequiresRoles, @RequiresPermissions），借助SpringAOP扫描使用Shiro注解的类,并在必要时进行安全逻辑验证
     */
    @Bean
    @DependsOn("lifecycleBeanPostProcessor")//是一个String数组
    public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator(){
        return new DefaultAdvisorAutoProxyCreator();
    }
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(){
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager());
        return authorizationAttributeSourceAdvisor;
    }

    //Shiro支持Spring RPC调用
}
