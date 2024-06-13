package com.example.myproject.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;

@Data
@Entity
@Table(name = "supporter")
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
