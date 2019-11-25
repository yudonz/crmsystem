package com.crazycode;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@MapperScan(basePackages = "com.crazycode.mapper")

public class CrmsystemJspApplication {

    public static void main(String[] args) {
        SpringApplication.run(CrmsystemJspApplication.class, args);
    }

}
