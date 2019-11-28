package com.crazycode.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.crazycode.entity.Permission;
import com.crazycode.entity.Role;
import com.crazycode.service.IPermissionService;
import com.crazycode.service.IRoleService;
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
 * @since 2019-11-26
 */
@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private IRoleService roleService;
    @Autowired
    private IPermissionService permissionService;

    @GetMapping("/role-list/{pageNum}/{pageSize}")
    public ModelAndView list(@PathVariable("pageNum") Integer pageNum, @PathVariable("pageSize") Integer pageSize) {
        System.out.println("查询");
        PageHelper.startPage(pageNum, pageSize);
        List<Role> list = roleService.list();
        list.forEach(System.out::println);

        PageInfo pageInfo = new PageInfo(list);
        ModelAndView mv = new ModelAndView("pages/role-list");
        mv.addObject("roles", list);
        mv.addObject("pageInfo", pageInfo);
        return mv;
    }

    @GetMapping("/role-add")
    public String add() {
        return "pages/role-add";
    }

    @ResponseBody
    @PutMapping("/save.do")
    public String insert(Role role) {
        System.out.println("插入新数据");
        boolean save = roleService.save(role);
        if (save) {
            return "保存成功";
        } else {
            return "保存失败";
        }
    }

    @GetMapping("/delete/{rid}")
    public String delete(@PathVariable("rid") String id) {
        boolean remove = roleService.remove(new QueryWrapper<Role>().eq("id", id));
        System.out.println("删除状态：" + remove);
        return "redirect:/role/role-list/1/6";
    }

    @GetMapping("/detail/{rid}")
    public ModelAndView detail(@PathVariable("rid") String rid) {
        System.out.println("角色详情：");
        Role one = roleService.selectById(rid);
        ModelAndView mv = new ModelAndView("pages/role-show");
        mv.addObject("role", one);
        return mv;
    }

    @GetMapping("/addPermission/{rid}")
    public ModelAndView addPermission(@PathVariable("rid") String rid) {
        System.out.println("给角色添加权限页面");
        ModelAndView mv = new ModelAndView("pages/role-permission-add");
        List<Permission> permissions = permissionService.list();
        mv.addObject("permissionList", permissions);
        Role role = roleService.selectById(rid);
        mv.addObject("role",role);
        return mv;
    }

    @PostMapping("/addPermissionsToRole")
    public String addPermissionsToRole(@RequestParam("ids") List<String>ids,String roleId){
        System.out.println("添加权限");
        boolean flag = roleService.addPermissionsToRole(ids, roleId);
        System.out.println("添加状态:"+flag);
        return "redirect:/role/role-list/1/6";
    }
}
