package com.crazycode;


import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.segments.MergeSegments;
import com.crazycode.entity.Member;
import com.crazycode.mapper.MemberMapper;
import com.crazycode.service.IMemberService;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
class CrmsystemJspApplicationTests {

    @Autowired
    private DataSource dataSource;

    @Autowired
    private MemberMapper memberMapper;
    @Autowired
    private IMemberService iMemberService;

    @Test
    void contextLoads() throws SQLException {
        System.out.println(dataSource.getConnection());
    }

    @Test
    void test2() {
        Member byId = iMemberService.getById(1);
        System.out.println(byId);
        List<Member> list = iMemberService.list();
        System.out.println(list);
//        iMemberService.getOne()
    }

    @Test
    void test1() {
        Member member = memberMapper.selectById("1");
        System.out.println(member);
//        EntityWrapper<Member> qryWrapper = new EntityWrapper<>();
//        memberMapper.selectList(queryWrapper);
        Member member1=new Member();
//        member1.setId(7);
        member1.setName("liwei");
        member1.setNickName("wei");
        int insert = memberMapper.insert(member1);
        System.out.println(member1);
//        QueryWrapper<Member> ew = new QueryWrapper<>();
//        Member member2 = memberMapper.selectOne(member);
//        System.out.println(member2);
    }



}
