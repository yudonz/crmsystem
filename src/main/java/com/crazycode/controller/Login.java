package com.crazycode.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.crazycode.entity.Users;
import com.crazycode.service.IUsersService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class Login {

    @Autowired
    private IUsersService usersService;

    @PostMapping("/login.do")
    public ModelAndView login(Users user, HttpSession session) {
        //获得主体对象
        Subject currentUser = SecurityUtils.getSubject();
        String info = null;
        if (!currentUser.isAuthenticated()) {
            //把用户名和密码封装成UsernamePasswordToken对象
            UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPassword());

            try {
                currentUser.login(token);//当前用户进行登陆 参数类型:AuthenticationToken
            } catch (UnknownAccountException uae) {
                info = "用户名不正确";
            } catch (IncorrectCredentialsException ice) {
                info = "密码不正确";
            } catch (LockedAccountException lae) {
                info = "账号被锁定";
            } catch (AuthenticationException ae) {
                info = "联系管理员";
            }
        }

        ModelAndView mv = null;
        if (info == null) {
            Users user2 = (Users) session.getAttribute("user");
            if (user2!=null){
                System.out.println("session"+user2);
            }
            mv = new ModelAndView("pages/main");
            Users user1= (Users) SecurityUtils.getSubject().getPrincipal();
            session.setAttribute("user", user1);
        } else {
            System.out.println("info:" + info);
            mv = new ModelAndView("login");
            return mv;
        }
//        QueryWrapper<Users> qw = new QueryWrapper<>();
//        qw.eq("username", user.getUsername())
//                .eq("password", user.getPassword());
//        Users one = usersService.getOne(qw);
//        ModelAndView mv = null;
//        if (one != null) {
//            System.out.println("登录成功");
//            mv = new ModelAndView("pages/main");
//            session.setAttribute("user", one);
//        } else {
//            System.out.println("登录失败");
//            mv = new ModelAndView("login");
//        }
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

}
