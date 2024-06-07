package com.example.myproject.mapper;

import com.example.myproject.entity.FileList;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DocumentMapper extends JpaRepository<FileList,Long> {
}
