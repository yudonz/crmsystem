package com.crazycode.controller;


import com.crazycode.entity.Syslog;
import com.crazycode.service.ISyslogService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhao yudong
 * @since 2019-12-02
 */
@Controller
@RequestMapping("/sysLog")
public class SyslogController {
    @Autowired
    private ISyslogService syslogService;


    @GetMapping("/findAll/{pageNum}/{pageSize}")
    public ModelAndView findAll(@PathVariable("pageNum") Integer pageNum,
                                @PathVariable("pageSize") Integer pageSize){

        String orderBy = "visitTime desc";//按照排序字段 倒序 排序
        PageHelper.startPage(pageNum, pageSize,orderBy);
        List<Syslog> list = syslogService.list();
        PageInfo pageInfo=new PageInfo(list);
        ModelAndView mv=new ModelAndView("pages/syslog-list");
        mv.addObject("pageInfo",pageInfo);
        return mv;
    }


}
