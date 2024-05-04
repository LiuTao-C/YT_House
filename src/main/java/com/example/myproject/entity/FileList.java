package com.example.myproject.entity;


import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "reportfile")
public class FileList {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "file_name")
    private String fileName;
    
    @Column(name = "file_path")
    private String filePath;
    
    @Column(name = "file_size")
    private Long fileSize;
    
    @Column(name = "file_type")
    private String fileType;
    
    
    @Column(name = "origin_name")
    private String originName;
    
//    @Column(name = "update_time")
//    private String updateTime;
//
//    @Column(name = "document_type")
//    private  String documentType;

}
