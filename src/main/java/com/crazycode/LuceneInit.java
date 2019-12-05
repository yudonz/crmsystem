package com.crazycode;

import com.crazycode.service.LuceneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Component
@Order(1)
public class LuceneInit implements ApplicationRunner {

    @Autowired
    LuceneService luceneService;


    @Override
    public void run(ApplicationArguments args) throws Exception {
        System.out.println("初始化索引库");
        luceneService.createProductIndex();
    }
}
