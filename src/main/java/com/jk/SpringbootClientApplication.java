package com.jk;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;

@SpringBootApplication
@ImportResource(value = {"classpath:spring-dubbo-consumer.xml"})
@MapperScan("com.jk.service")
public class SpringbootClientApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringbootClientApplication.class, args);
    }
}
