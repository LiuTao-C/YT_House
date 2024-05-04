package com.example.myproject.service;

import com.example.myproject.entity.HazardLog;
import com.example.myproject.mapper.HazardLogMapper;
import jakarta.inject.Inject;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

public class HazardLogService {
    @Inject
    HazardLogMapper hazardLogMapper;
    
    public Page<HazardLog> findlist(Integer page,Integer size){
        Pageable pageable = PageRequest.of(page-1,size);
        return hazardLogMapper.findAll(pageable);
    }
    
    public void deletById(Long id){
        hazardLogMapper.deleteById(id);
    }
    public HazardLog updateById(HazardLog hazardLog){
        return hazardLogMapper.saveAndFlush(hazardLog);
    }
    public HazardLog findById(Long id){
        return hazardLogMapper.getOne(id);
    }
    
}
