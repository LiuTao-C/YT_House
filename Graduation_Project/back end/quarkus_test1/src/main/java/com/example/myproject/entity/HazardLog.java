package com.example.myproject.entity;


import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "hazardlog")
public class HazardLog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String location;

    @Column(name = "hazardlevel")
    private String hazardLevel;

    @Column(name = "find_date")
    private  String findDate;

    @Column
    private  String registor;

    @Column
    private  String period;

    @Column(name = "detail_information")
    private  String detailInfo;

}
