package com.example.myproject.entity;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import java.io.Serializable;

public class Supporter implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column
    private String name;
    
    @Column
    private String department;
    
    @Column
    private String phone;
    
    @Column
    private String email;
    
    @Column
    private  String address;
    
    @Column
    private  String status;
    
    //赞助的项目
    @Column(name = "date_time")
    private  String dateTime;
    
    @Column(name = "project_name")
    private  String projectName;
    
    @Column(name = "project_status")
    private  String projectStatus;
    
    @Column
    private  String Money;
    
}
