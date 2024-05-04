package com.example.myproject.service;

import com.example.myproject.entity.Supporter;
import com.example.myproject.mapper.SupporterMapper;
import jakarta.inject.Inject;
import jakarta.persistence.Id;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

public class SupporterService {
    @Inject
    SupporterMapper supporterMapper;
    
    
    public Page<Supporter> findList(Integer page ,Integer size){
        Pageable pageable = PageRequest.of(page-1 ,size);
        return supporterMapper.findAll(pageable);
    }
    public Supporter findById(Long id){
        return supporterMapper.getOne(id);
    }
    public  void deleteById(Long id){
        supporterMapper.deleteById(id);
    }
    public Supporter updateById(Supporter supporter){
        return supporterMapper.saveAndFlush(supporter);
    }
    
}
