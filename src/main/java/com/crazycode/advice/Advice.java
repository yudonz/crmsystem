package com.crazycode.advice;

import org.apache.juli.logging.Log;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

@Aspect
@Component
public class Advice {
    //代表包下的任意类:execution( * *.*()) 代表任意返回类型,任意包下,任意类的任意方法
    @Pointcut("execution(* com.crazycode.controller..*.*(..))")
    public void p1(){}

    @Before("p1()")
    public void before(){
//        System.out.println(">>>>>> before <<<<<<<");
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        System.out.println("前 uri:"+request.getRequestURI());


    }

    @AfterReturning("p1()")
    public void after() throws Exception{
//        System.out.println(">>>>>> after <<<<<<<");
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        System.out.println("后 uri:"+request.getRequestURI());
    }
}
