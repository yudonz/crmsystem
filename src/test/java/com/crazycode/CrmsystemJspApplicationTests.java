package com.crazycode;

import com.crazycode.mapper.UsersMapper;
import com.crazycode.mapper.UsersRoleMapper;
import com.crazycode.pojo.Users;
import com.crazycode.pojo.UsersRole;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.List;

@SpringBootTest
class CrmsystemJspApplicationTests {

    @Autowired
    private DataSource dataSource;
    @Autowired
    private UsersMapper usersMapper;
    @Autowired
    private UsersRoleMapper usersRoleMapper;

    @Test
    void contextLoads() throws SQLException {
        System.out.println(dataSource.getConnection());
    }

    @Test
    void test1(){
        List<Users> users = usersMapper.selectAll();
        System.out.println(users);
    }

    @Test
    void test2(){
        List<UsersRole> usersRoles = usersRoleMapper.selectAll();
        System.out.println(usersRoles);
    }

}
