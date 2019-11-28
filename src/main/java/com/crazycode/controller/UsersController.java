package com.crazycode.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.crazycode.entity.Role;
import com.crazycode.entity.Users;
import com.crazycode.service.IRoleService;
import com.crazycode.service.IUsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
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
@RequestMapping("/user")
public class UsersController {

    @Autowired
    private IUsersService usersService;
    @Autowired
    private IRoleService roleService;


    @PostMapping("/login.do")
    public ModelAndView login(Users user, HttpSession session) {
        QueryWrapper<Users> qw = new QueryWrapper<>();
        qw.eq("username", user.getUsername())
                .eq("password", user.getPassword());
        Users one = usersService.getOne(qw);
        ModelAndView mv = null;
        if (one != null) {
            System.out.println("登录成功");
            mv = new ModelAndView("pages/main");
            session.setAttribute("user", one);
        } else {
            System.out.println("登录失败");
            mv = new ModelAndView("login");
        }
        return mv;
    }

    @GetMapping("/logout.do")
    public String logout(HttpSession session) {
        if (session != null) {
            System.out.println("注销:");
            System.out.println(session.getAttribute("user"));
            session.invalidate();
        }
        return "login";
    }

    @GetMapping("/user-list")
    public ModelAndView userList() {
        List<Users> list = usersService.list();
        //list.forEach(System.out::println);
        ModelAndView mv = new ModelAndView("pages/user-list");
        mv.addObject("users", list);
        return mv;
    }

    @PostMapping("/save.do")
    @ResponseBody
    public String save(Users user) {
        System.out.println("插入方法");
        System.out.println(user);
        boolean save = usersService.save(user);
        if (save) {
            System.out.println("插入成功");
            return "成功";
        } else {
            System.out.println("插入失败");
            return "失败";
        }
    }

    @GetMapping("/detail/{userId}")
    public ModelAndView detail(@PathVariable("userId") String id) {
        System.out.println("用户详情:");
        Users user = usersService.selectById(id);
        System.out.println(user);
        ModelAndView mv = new ModelAndView("pages/user-show1");
        mv.addObject("user", user);
        return mv;
    }

    @GetMapping("/user-role-add/{userId}")
    public ModelAndView userRoleAdd(@PathVariable("userId") String id) {
        System.out.println("给用户添加角色页面");
        Users user = usersService.selectById(id);
        System.out.println(user);
        List<Role> roles = roleService.list();
        ModelAndView mv = new ModelAndView("pages/user-role-add");
        mv.addObject("user", user);
        mv.addObject("roles", roles);
        return mv;
    }

    @PostMapping("/addRolesToUser")
    public String addRolesToUser(@RequestParam(value = "ids") List<String> rids, String userId) {

        boolean flag = usersService.addRolesToUser(rids, userId);
        System.out.println("添加角色状态"+flag);

        return "redirect:/user/user-list";
    }
}
