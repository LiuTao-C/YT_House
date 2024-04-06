package com.example.myproject.service;


import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.transaction.Transactional;
import com.example.myproject.entity.UploadedFile;

@ApplicationScoped
public class FileUploadService {
    
    private final EntityManager entityManager;
    
    public FileUploadService(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
    
    @Transactional
    public void uploadFile(UploadedFile uploadedFile) {
        entityManager.persist(uploadedFile);
    }
}






