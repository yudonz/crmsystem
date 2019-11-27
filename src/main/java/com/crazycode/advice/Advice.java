package com.crazycode.advice;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class Advice {
    //代表包下的任意类:execution( * *.*()) 代表任意返回类型,任意包下,任意类的任意方法
    @Pointcut("execution(* com.crazycode.*(..))")
    public void p1(){}

    @Before("p1()")
    public void before(){
        System.out.println(">>>>>> before <<<<<<<");
    }
}
