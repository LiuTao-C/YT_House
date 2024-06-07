package com.example.myproject.response;


import org.springframework.data.domain.Page;

import java.io.Serializable;
import java.util.List;


public class ResponsePage<T> implements Serializable {
    
    private static final long serialVersionUID = 8029494783945793535L;
    
    private long count;
    
    private Integer code;
    
    private String msg;
    
    private List<T> data;
    
    public ResponsePage() {
        this.msg = "success";
        this.code = 200;
    }
    
    public ResponsePage(long count, List<T> data) {
        this.code = 200;
        this.msg = "success";
        this.count = count;
        this.data = data;
    }
    
    /**
     * 返回正常分页数据数据
     * @param page 分页数据
     * @param <T> 泛型
     * @return 分页结果
     */
    public static <T> ResponsePage<T> success(Page<T> page){
        return new ResponsePage<T>(page.getTotalElements(), page.getContent());
    }
    
    public String getMsg() {
        return msg;
    }
    
    public void setMsg(String msg) {
        this.msg = msg;
    }
    
    public long getCount() {
        return count;
    }
    
    public void setCount(long count) {
        this.count = count;
    }
    
    public Integer getCode() {
        return code;
    }
    
    public void setCode(Integer code) {
        this.code = code;
    }
    
    public List<T> getData() {
        return data;
    }
    
    public void setData(List<T> data) {
        if (data == null || data.size() == 0) {
            this.code = 404;
            this.msg = "暂无数据";
        } else {
            this.count = data.size();
            this.data = data;
        }
    }
    
    /**
     * 设置IPage数据
     *
     * @param page page
     */
    public void setIPage(Page<T> page) {
        this.code = 200;
        this.msg = "SUCCESS";
        this.data = page.getContent();
        this.count = page.getTotalPages();
    }
    
}