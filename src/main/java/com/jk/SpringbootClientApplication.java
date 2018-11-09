package com.jk;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@ImportResource(value = {"classpath:spring-dubbo-consumer.xml"})
@EnableScheduling
public class SpringbootClientApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringbootClientApplication.class, args);
    }
}
