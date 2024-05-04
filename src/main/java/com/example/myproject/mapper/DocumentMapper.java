package com.example.myproject.mapper;

import com.example.myproject.entity.Document;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DocumentMapper extends JpaRepository<Document,Long> {
}
