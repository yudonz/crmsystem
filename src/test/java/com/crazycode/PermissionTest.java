package com.crazycode;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.crazycode.entity.Permission;
import com.crazycode.service.IPermissionService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class PermissionTest {

    @Autowired
    private IPermissionService permissionService;


    @Test
    public void selectById(){
        String pid="430f74ba-a155-11e9-b4b3-74d02bd4fd82";
        Permission permission = permissionService.selectById(pid);
        System.out.println(permission);
    }

    @Test
    public void selectByRid(){
        String rid="160d9216-a152-11e9-b4b3-74d02bd4fd82";
        List<Permission> permissions = permissionService.selectByRid(rid);
        System.out.println(permissions);
    }

    @Test
    public void delete(){
        String pid="116d79397a02300cb380e1fcd98f9b0b";
        boolean remove = permissionService.remove(new QueryWrapper<Permission>().eq("id", pid));
        System.out.println(remove);
    }
}
