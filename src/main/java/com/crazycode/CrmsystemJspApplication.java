package com.crazycode;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.crazycode.mapper")
public class CrmsystemJspApplication {

    public static void main(String[] args) {
        SpringApplication.run(CrmsystemJspApplication.class, args);
    }

}
