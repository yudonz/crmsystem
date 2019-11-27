package com.crazycode;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.crazycode.entity.Users;
import com.crazycode.service.IUsersService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

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

    @Test
    public void selectAll(){
        List<Users> list = usersService.list();
        list.forEach(System.out::println);
    }

    @Test
    public void save(){
        Users user=new Users();
        user.setUsername("chenhao");
        user.setPassword("123");
        user.setEmail("@163");

        boolean save = usersService.save(user);
        System.out.println(save);
    }

    @Test
    public void selectById(){
        Users user = usersService.selectById("ab07416d-a153-11e9-b4b3-74d02bd4fd82");
        System.out.println(user);
    }

    @Test
    public void addRole(){
//        boolean b = usersService.addRoleToUser("1", "2");
//        System.out.println(b);
    }
}
