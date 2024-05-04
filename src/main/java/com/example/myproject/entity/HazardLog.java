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
    
    @Column(name = "hazard_code")
    private String hazardCode;
    
    @Column(name = "hazard_level")
    private String hazardLevel;
    
    @Column(name = "discovery_date")
    private  String discoveryDate;
    
    @Column(name = "registrar")
    private  String registrar;
    
    @Column
    private  String period;
    
    @Column(name = "detail_information")
    private  String detailInfo;
    
    @Column(name = "file_id")
    private String fileId;
}
