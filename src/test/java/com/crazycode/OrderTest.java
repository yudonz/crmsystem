package com.crazycode;

import com.crazycode.entity.Orders;
import com.crazycode.mapper.OrdersMapper;
import com.crazycode.service.IOrdersService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class OrderTest {

    @Autowired
    private IOrdersService ordersService;
    @Autowired
    private OrdersMapper ordersMapper;

    @Test
    void list(){
        List<Orders> list = ordersMapper.selectAll();
        list.forEach(System.out::println);
    }

    @Test
    void insert(){
        Orders order=new Orders();
        order.setOrderNum("111");
        boolean save = ordersService.save(order);
        System.out.println(save);
    }

    @Test
    void select(){
        Orders orders = ordersService.selectById(3);
        System.out.println(orders);
    }
}
