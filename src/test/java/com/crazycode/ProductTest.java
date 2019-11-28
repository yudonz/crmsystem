package com.crazycode;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.crazycode.entity.Product;
import com.crazycode.mapper.ProductMapper;
import com.crazycode.service.IProductService;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.sql.Timestamp;
import java.util.List;

@SpringBootTest
public class ProductTest {

    @Autowired
    IProductService productService;

    @Test
    void test(){
        List<Product> list = productService.list();
        list.forEach(System.out::println);
    }


    @Test
    void save(){
        Product product=new Product();
        product.setProductNum("111");
        product.setProductName("上海一日游");
        product.setCityName("上海");
        product.setDepartureTime("2019-11-14 14:30");
        product.setProductPrice(100.0);
        product.setProductDesc("李威带你逛上海");
        product.setProductStatus(1);
        System.out.println(product);
        System.out.println(product.getDepartureTime());
        boolean save = productService.save(product);
        System.out.println(save);
    }

    @Test
    void delete(){
        boolean remove = productService.remove(new QueryWrapper<Product>().eq("id", "c661e1db0581b3f8a0d305708166f146"));
        System.out.println(remove);
    }

    @Autowired
    private ProductMapper productMapper;
    @Test
    void delete2(){
        int delete = productMapper.delete(new QueryWrapper<Product>().eq("id", "d6a7e659d3d016aa162cb9264ef9efa3"));
        System.out.println(delete);
    }

    @Test
    void update1(){
        String pid="524eacc699bb8e8a6ae14f1ea7be8b52";
        Product product=productService.getOne(new QueryWrapper<Product>().eq("id",pid));
        product.setProductStatus(0);
        boolean update = productService.updateById(product);
        System.out.println(update);
    }

    @Test
    void update2(){
        String pid="524eacc699bb8e8a6ae14f1ea7be8b52";
        QueryWrapper<Product> qw = new QueryWrapper<>();
        Product product=productMapper.selectOne(qw.eq("id",pid));
        product.setProductStatus(0);
        int update = productMapper.updateById(product);
        System.out.println(update);
    }


}
