package com.example.myproject.service;

import com.example.myproject.entity.UploadFile;
import com.example.myproject.mapper.UploadFileMapper;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

@ApplicationScoped
public class UploadFileService {
    @Inject
    UploadFileMapper uploadFileMapper;
    
    //更新数据
    public UploadFile updateById(UploadFile uploadFile){
        return uploadFileMapper.saveAndFlush(uploadFile);
    }
}
