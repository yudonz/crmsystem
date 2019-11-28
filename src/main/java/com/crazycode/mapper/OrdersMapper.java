package com.crazycode.mapper;

import com.crazycode.entity.Orders;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhao yudong
 * @since 2019-11-28
 */
public interface OrdersMapper extends BaseMapper<Orders> {

    Orders selectById(Integer id);
    List<Orders> selectAll();
}
