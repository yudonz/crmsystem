package com.crazycode;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.crazycode.entity.Users;
import com.crazycode.service.IUsersService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UserTest {

    @Autowired
    private IUsersService usersService;

    @Test
    public void login(){
        Users user=new Users();
        user.setUsername("chenhao");
        user.setPassword("123");

        QueryWrapper<Users> qw=new QueryWrapper<>();
        qw.eq("username","chenhao")
        .eq("password","123");

        Users one = usersService.getOne(qw);
        System.out.println(one);

    }

}
