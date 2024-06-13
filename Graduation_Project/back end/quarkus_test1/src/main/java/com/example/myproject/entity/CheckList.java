package com.example.myproject.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;


@Data
@Entity
@Table(name = "checklist")
public class CheckList implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column
    private String content;
    
    @Column
    private  String type;
    
    @Column(name = "create_by")
    private  String createBy;
    
    @Column(name = "create_date")
    private String createDate;
    
    @Column(name = "check_list_id")
    private Integer checkListId;
    
//    private Integer isDel = 0; // 1
 
 /*
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    
    public String getCreateBy() {
        return createBy;
    }
    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }
    
    public String getCreateDate() {
        return createDate;
    }
    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }
    
    public Integer getCheckListId() {
        return checkListId;
    }
    public void setCheckListId(Integer checkListId) {
        this.checkListId = checkListId;
    }
*/
}
