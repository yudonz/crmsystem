package com.crazycode;

import com.crazycode.entity.Syslog;
import com.crazycode.service.ISyslogService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class LogTest {

    @Autowired
    private ISyslogService syslogService;

    @Test
    void test1(){
        List<Syslog> list = syslogService.list();
        System.out.println(list);
    }
}
