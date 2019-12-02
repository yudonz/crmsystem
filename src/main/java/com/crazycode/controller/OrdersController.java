package com.crazycode.controller;


import com.crazycode.entity.Orders;
import com.crazycode.service.IOrdersService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author zhao yudong
 * @since 2019-11-28
 */
@Controller
@RequestMapping("/orders")
public class OrdersController {

    @Autowired
    private IOrdersService ordersService;

    @GetMapping("/order-list/{pageNum}/{pageSize}")
    public ModelAndView orderList(@PathVariable("pageNum") Integer pageNum,
                                  @PathVariable("pageSize") Integer pageSize) {
        System.out.println("查询所有订单");
        PageHelper.startPage(pageNum, pageSize);
        List<Orders> list = ordersService.selectAll();
        PageInfo pageInfo = new PageInfo(list);
        ModelAndView mv = new ModelAndView("pages/orders-page-list");
        mv.addObject("pageInfo", pageInfo);
        return mv;
    }

    @GetMapping("/findById/{oid}")
    public ModelAndView findById(@PathVariable("oid") String oid) {
        Orders order = ordersService.selectById(Integer.parseInt(oid));
        ModelAndView mv = new ModelAndView("pages/orders-show");
        mv.addObject("orders", order);
        return mv;
    }
}
