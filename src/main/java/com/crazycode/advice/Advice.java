package com.crazycode.advice;

import com.crazycode.entity.Syslog;
import com.crazycode.entity.Users;
import com.crazycode.service.ISyslogService;
import org.apache.juli.logging.Log;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;

@Aspect
@Component
public class Advice {
    @Autowired
    private ISyslogService syslogService;
    private long startTime;
    private long endTime;

    //代表包下的任意类:execution( * *.*()) 代表任意返回类型,任意包下,任意类的任意方法
    @Pointcut("execution(* com.crazycode.controller..*.*(..)) && !execution(* com.crazycode.controller.Login.login(..)) ")
    public void p1(){}

    @Before("p1()")
    public void before(){
//        System.out.println(">>>>>> before <<<<<<<");
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
//        System.out.println("前 uri:"+request.getRequestURI());

        startTime = System.currentTimeMillis();

    }

    @AfterReturning("p1()")
    public void after(JoinPoint joinPoint) throws Exception{
//        System.out.println(">>>>>> after <<<<<<<");
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
//        System.out.println("后 uri:"+request.getRequestURI());

        endTime = System.currentTimeMillis();

        Users user = (Users) request.getSession().getAttribute("user");
        if (user!=null){
            Syslog log=new Syslog();
            log.setVisitTime(new Timestamp(System.currentTimeMillis()));
            log.setUsername(user.getUsername());
            log.setIp(request.getRemoteAddr());
            log.setUrl(request.getRequestURI());
            log.setExecutionTime((int) (endTime-startTime));
            log.setMethod(joinPoint.getSignature().getName());
            System.out.println(log);
            syslogService.save(log);
        }

    }
}
