package com.sonkabin;

import org.springframework.amqp.rabbit.annotation.EnableRabbit;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
@EnableRabbit // 启用消息注解
public class ItHumanResourcesApplication {

    public static void main(String[] args) {
        SpringApplication.run(ItHumanResourcesApplication.class, args);
    }

}

