package com.example.myproject.pages;


import java.io.Serializable;

/**
 * @version V1.0.0
 * @ClassName: {@link ResponseResult}
 * @Description: 后台返回统一DTO类
 * @author: 兰州
 * @date: 2019/7/16 9:22
 * @Copyright: @2019 All rights reserved.
 */


public class ResponseResult<T> implements Serializable {
    
    private static final long serialVersionUID = -4539213916903487309L;
    
    private Integer code;
    
    private String message;
    
    private T data;
    
    public ResponseResult(Integer code) {
        this.code = code;
    }
    
    public ResponseResult(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
    
    public ResponseResult(Integer code, T data) {
        this.code = code;
        this.data = data;
    }
    
    /**
     * success response
     *
     * @return
     */
    public static ResponseResult success() {
        return new ResponseResult(ServerResponseEnum.SUCCESS.getCode());
    }
    
    public static ResponseResult success(String message) {
        return new ResponseResult(ServerResponseEnum.SUCCESS.getCode(), message);
    }
    
    public static <T> ResponseResult success(T data) {
        return new ResponseResult<>(ServerResponseEnum.SUCCESS.getCode(), data);
    }
    
    /**
     * fail response
     *
     * @return
     */
    public static ResponseResult fail() {
        return new ResponseResult(ServerResponseEnum.FAIL.getCode());
    }
    
    public static ResponseResult fail(String message) {
        return new ResponseResult(ServerResponseEnum.FAIL.getCode(), message);
    }
    
    public static <T> ResponseResult fail(T data) {
        return new ResponseResult<>(ServerResponseEnum.FAIL.getCode(), data);
    }
    
    /**
     * notfound response
     *
     * @return
     */
    public static ResponseResult notFound() {
        return new ResponseResult(ServerResponseEnum.NOTFOUND.getCode());
    }
    
    public static ResponseResult notFound(String message) {
        return new ResponseResult(ServerResponseEnum.NOTFOUND.getCode(), message);
    }
    
    public static <T> ResponseResult notFound(T data) {
        return new ResponseResult<>(ServerResponseEnum.NOTFOUND.getCode(), data);
    }
    
    /**
     * error response
     *
     * @return
     */
    public static ResponseResult error() {
        return new ResponseResult(ServerResponseEnum.ERROR.getCode());
    }
    
    public static ResponseResult error(String message) {
        return new ResponseResult(ServerResponseEnum.ERROR.getCode(), message);
    }
    
    public static <T> ResponseResult error(T data) {
        return new ResponseResult<>(ServerResponseEnum.ERROR.getCode(), data);
    }
    
    /**
     * unauthorized response
     *
     * @return
     */
    public static ResponseResult unauthorized() {
        return new ResponseResult(ServerResponseEnum.UNAUTHORIZED.getCode());
    }
    
    public static ResponseResult unauthorized(String message) {
        return new ResponseResult(ServerResponseEnum.UNAUTHORIZED.getCode(), message);
    }
    
    enum ServerResponseEnum {
        /**
         * 状态枚举
         */
        SUCCESS(200, "成功"),
        FAIL(201, "失败"),
        NOTFOUND(404, "未找到"),
        ERROR(500, "系统错误"),
        UNAUTHORIZED(403, "未授权");
        
        private int code;
        private String message;
        
        ServerResponseEnum(int code, String message) {
            this.code = code;
            this.message = message;
        }
        
        public int getCode() {
            return code;
        }
        
        public String getMessage() {
            return message;
        }
    }
    
    
    public Integer getCode() {
        return code;
    }
    
    public void setCode(Integer code) {
        this.code = code;
    }
    
    public String getMessage() {
        return message;
    }
    
    public void setMessage(String message) {
        this.message = message;
    }
    
    public T getData() {
        return data;
    }
    
    public void setData(T data) {
        this.data = data;
    }
    
}