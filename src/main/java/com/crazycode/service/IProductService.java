package com.crazycode.service;

import com.crazycode.entity.Product;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author zhao yudong
 * @since 2019-11-27
 */
public interface IProductService extends IService<Product> {

    boolean deleteProducts(List<String> ids);

    boolean openProducts(List<String> ids);

    boolean closeProducts(List<String> ids);
}
