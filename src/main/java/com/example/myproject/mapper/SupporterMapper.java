package com.example.myproject.mapper;

import com.example.myproject.entity.Supporter;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SupporterMapper  extends JpaRepository<Supporter,Long> {
}
