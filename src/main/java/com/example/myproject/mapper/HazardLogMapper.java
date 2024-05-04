package com.example.myproject.mapper;

import com.example.myproject.entity.HazardLog;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HazardLogMapper extends JpaRepository<HazardLog,Long> {

}
