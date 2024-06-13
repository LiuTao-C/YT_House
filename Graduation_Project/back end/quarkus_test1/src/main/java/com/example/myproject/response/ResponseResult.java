package com.example.myproject.response;


import java.io.Serializable;




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
    
    public ResponseResult(ServerResponseEnum responseEnum, T data) {
        this.code = responseEnum.code;
        this.message = responseEnum.message;
        this.data = data;
    }
    
    /**
     * success response
     *
     * @return 成功
     */
    public static <T> ResponseResult<T> success() {
        return new ResponseResult<>(ServerResponseEnum.SUCCESS.getCode());
    }
    
    public static <T> ResponseResult<T> success(T data) {
        return new ResponseResult<>(ServerResponseEnum.SUCCESS, data);
    }
    
    /**
     * fail response
     *
     * @return 失败
     */
    public static <T> ResponseResult<T> fail() {
        return new ResponseResult<>(ServerResponseEnum.FAIL.getCode());
    }
    
    public static <T> ResponseResult<T> fail(String message) {
        return new ResponseResult<>(ServerResponseEnum.FAIL.getCode(), message);
    }
    
    /**
     * notfound response
     *
     * @return 404
     */
    public static <T> ResponseResult<T> notFound() {
        return new ResponseResult<>(ServerResponseEnum.NOTFOUND.getCode());
    }
    
    public static <T> ResponseResult<T> notFound(String message) {
        return new ResponseResult<>(ServerResponseEnum.NOTFOUND.getCode(), message);
    }
    
    /**
     * error response
     *
     * @return 错误
     */
    public static <T> ResponseResult<T> error() {
        return new ResponseResult<>(ServerResponseEnum.ERROR.getCode());
    }
    
    public static <T> ResponseResult<T> error(String message) {
        return new ResponseResult<>(ServerResponseEnum.ERROR.getCode(), message);
    }
    
    /**
     * unauthorized response
     *
     * @return 未授权
     */
    public static <T> ResponseResult<T> unauthorized() {
        return new ResponseResult<>(ServerResponseEnum.UNAUTHORIZED.getCode());
    }
    
    public static <T> ResponseResult<T> unauthorized(String message) {
        return new ResponseResult<>(ServerResponseEnum.UNAUTHORIZED.getCode(), message);
    }
    
    public enum ServerResponseEnum {
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