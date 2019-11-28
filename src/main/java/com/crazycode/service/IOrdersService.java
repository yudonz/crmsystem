package com.crazycode.service;

import com.crazycode.entity.Orders;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhao yudong
 * @since 2019-11-28
 */
public interface IOrdersService extends IService<Orders> {
    Orders selectById(Integer id);
    List<Orders> selectAll();
}
