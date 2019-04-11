package com.sonkabin.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.amqp.support.converter.MessageConverter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

@Profile({"prod", "work-queues"})
@Configuration
public class RabbitMQConfig {

    /*
    配置消息转换器，默认配置是用Java的序列化与反序列化消息转换器
     */
    @Bean
    public MessageConverter messageConverter() {
        return new Jackson2JsonMessageConverter();
    }

    @Bean
    public Queue workQueue() {
        return new Queue("it-human-resources-queue");
    }

    @Bean
    public DirectExchange directExchange() {
        return new DirectExchange("it.human.resources.exchange");
    }

    @Bean
    public Binding binding(DirectExchange directExchange, Queue workQueue) {
        return BindingBuilder.bind(workQueue).to(directExchange).with("proficiency.update");
    }
}
