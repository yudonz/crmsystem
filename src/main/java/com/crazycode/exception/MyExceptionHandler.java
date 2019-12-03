package com.crazycode.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice//当控制器方法出错的时候，交给这个类来调用，处理异常
public class MyExceptionHandler {
    @ExceptionHandler(Exception.class)
    public ModelAndView handlerException(Exception ex) {
        ModelAndView mv=new ModelAndView();
        MyException se=null;
        if(ex instanceof MyException){
            se=(MyException)ex;
        }else {
            String message = ex.getMessage();
            se=new MyException(message);
        }
        mv.addObject("errorInfo",se.getMessage());
        mv.setViewName("403");
        return mv;
    }
}