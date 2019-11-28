package com.crazycode;

import com.crazycode.entity.Role;
import com.crazycode.service.IRoleService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RoleTest {

    @Autowired
    private IRoleService roleService;

    @Test
    public void selectById(){
        Role role = roleService.selectById("160d9216-a152-11e9-b4b3-74d02bd4fd82");
        System.out.println(role);
    }
}
