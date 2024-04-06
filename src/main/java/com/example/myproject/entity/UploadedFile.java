package com.example.myproject.entity;
import jakarta.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "uploaded_files")
public class UploadedFile implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "file_name")
    private String fileName;
    
    @Lob
    @Column(name = "file_data", columnDefinition = "BLOB")
    private byte[] fileData;
    
    // Getter and setter methods
    
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getFileName() {
        return fileName;
    }
    
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
    
    public byte[] getFileData() {
        return fileData;
    }
    
    public void setFileData(byte[] fileData) {
        this.fileData = fileData;
    }
}
