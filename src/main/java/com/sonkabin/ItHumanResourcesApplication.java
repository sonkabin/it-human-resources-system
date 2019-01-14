package com.sonkabin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
public class ItHumanResourcesApplication {

    public static void main(String[] args) {
        SpringApplication.run(ItHumanResourcesApplication.class, args);
    }

}

