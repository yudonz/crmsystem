package com.crazycode.mapper;

import com.crazycode.entity.Product;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhao yudong
 * @since 2019-11-27
 */
public interface ProductMapper extends BaseMapper<Product> {

    Product selectById(String id);
    List<Product> selectAll();
}
