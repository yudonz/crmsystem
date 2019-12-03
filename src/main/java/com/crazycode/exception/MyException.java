package com.crazycode.exception;

public class MyException extends RuntimeException {
    private String msg;

    public MyException(String msg) {
        this.msg=msg;
    }

    @Override
    public String getMessage() {
        return msg;
    }

    @Override
    public String toString() {
        return "SysException{" +
                "msg='" + msg + '\'' +
                '}';
    }
}
