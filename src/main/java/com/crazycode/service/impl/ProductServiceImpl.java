package com.crazycode.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.crazycode.entity.Product;
import com.crazycode.mapper.ProductMapper;
import com.crazycode.service.IProductService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author zhao yudong
 * @since 2019-11-27
 */
@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements IProductService {

    @Autowired
    private ProductMapper productMapper;

    @Override
    public boolean deleteProducts(List<String> ids) {
        for (String pid : ids) {
            int id = productMapper.delete(new QueryWrapper<Product>().eq("id", pid));
            if (id != 1) {
                return false;
            }
        }
        return true;
    }

    @Override
    public boolean openProducts(List<String> ids) {
        for (String pid : ids) {
            Product product=productMapper.selectOne(new QueryWrapper<Product>().eq("id",pid));
            product.setProductStatus(1);
            int id = productMapper.updateById(product);
            if (id != 1) {
                return false;
            }
        }
        return true;
    }

    @Override
    public boolean closeProducts(List<String> ids) {
        for (String pid : ids) {
            Product product=productMapper.selectOne(new QueryWrapper<Product>().eq("id",pid));
            product.setProductStatus(0);
            int id = productMapper.updateById(product);
            if (id != 1) {
                return false;
            }
        }
        return true;
    }
}
