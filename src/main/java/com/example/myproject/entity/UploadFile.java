package com.example.myproject.entity;


import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "reportfile")
public class UploadFile {
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
    

}
