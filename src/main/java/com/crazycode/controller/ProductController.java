package com.crazycode.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.crazycode.entity.Product;
import com.crazycode.service.IProductService;
import com.crazycode.service.LuceneService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.lucene.queryparser.classic.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhao yudong
 * @since 2019-11-27
 */
@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private IProductService productService;
    @Autowired
    private LuceneService luceneService;

    @GetMapping("/product-list")
    public ModelAndView productList(){
        System.out.println("产品列表：");
        List<Product> list = productService.list();
        ModelAndView mv=new ModelAndView("pages/product-list1");
        mv.addObject("products",list);
        return mv;
    }

    @PostMapping("/save")
    public String save(Product product){
        System.out.println("添加产品:");
        System.out.println(product);
        boolean save = productService.save(product);
        if (save) {
            System.out.println("插入成功");
        } else {
            System.out.println("插入失败");
        }
        return "redirect:/product/product-list";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam(value = "ids") List<String> ids){
        System.out.println("删除方法：");
        System.out.println(ids);
        boolean b = productService.deleteProducts(ids);
        if (b){
            System.out.println("删除成功");
        }else{
            System.out.println("删除失败");
        }
        return "redirect:/product/product-list";
    }

    @PostMapping("/open")
    public String put(@RequestParam(value = "ids") List<String> ids){
        System.out.println("开启方法：");
        System.out.println(ids);
        boolean b = productService.openProducts(ids);
        if (b){
            System.out.println("开启成功");
        }else{
            System.out.println("开启失败");
        }
        return "redirect:/product/product-list";
    }

    @PostMapping("/close")
    public String get(@RequestParam(value = "ids") List<String> ids){
        System.out.println("屏蔽方法：");
        System.out.println(ids);
        boolean b = productService.closeProducts(ids);
        if (b){
            System.out.println("关闭成功");
        }else{
            System.out.println("关闭失败");
        }
        return "redirect:/product/product-list";
    }

    @PostMapping("/search")
    public ModelAndView search(@RequestParam("search") String search) throws IOException, ParseException {
        List<Product> list = luceneService.searchProduct(search);
        ModelAndView mv=new ModelAndView("pages/product-list1");
        mv.addObject("products",list);
        return mv;
    }
}
