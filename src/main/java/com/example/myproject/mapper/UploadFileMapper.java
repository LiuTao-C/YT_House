package com.example.myproject.mapper;

import com.example.myproject.entity.UploadFile;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UploadFileMapper extends JpaRepository<UploadFile,Long> {

}
