package com.crazycode.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.crazycode.entity.Permission;
import com.crazycode.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.servlet.ModelAndView;

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
@RequestMapping("/permission")
public class PermissionController {

    @Autowired
    private IPermissionService permissionService;

    @GetMapping("/permission-list")
    public ModelAndView list(){
        System.out.println("所有权限");
        List<Permission> list = permissionService.list();
        System.out.println(list);
        ModelAndView mv=new ModelAndView("pages/permission-list");
        mv.addObject("permissions",list);
        return mv;
    }

    @GetMapping("/detail/{pid}")
    public ModelAndView detail(@PathVariable("pid") String pid){
        System.out.println("权限详情：");
        QueryWrapper<Permission> qw= new QueryWrapper<>();
        qw.eq("id",pid);
        Permission one = permissionService.getOne(qw);
        ModelAndView mv=new ModelAndView("pages/permission-show");
        mv.addObject("permission",one);
        return mv;
    }

    @PutMapping("/save")
    @ResponseBody
    public String save(Permission permission){
        System.out.println("插入新数据");
        boolean save = permissionService.save(permission);
        if (save){
            return "添加成功";
        }else{
            return "添加失败";
        }
    }

    @GetMapping("/delete/{pid}")
    public String delete(@PathVariable("pid") String id){
        boolean remove = permissionService.remove(new QueryWrapper<Permission>().eq("id", id));
        System.out.println("删除状态："+remove);
        return "redirect:/permission/permission-list";
    }
}
