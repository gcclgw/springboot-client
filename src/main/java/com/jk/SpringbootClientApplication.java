package com.jk;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ImportResource;
import org.springframework.amqp.core.Queue;

@SpringBootApplication
@ImportResource(value = {"classpath:spring-dubbo-consumer.xml"})

public class SpringbootClientApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringbootClientApplication.class, args);
    }
    @Bean
    public Queue getQueue(){
        return new Queue("regUser");
    }



}
