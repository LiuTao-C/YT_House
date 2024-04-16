package com.example.myproject.service;

import com.example.myproject.entity.AuditList;
import com.example.myproject.entity.ReportList;
import com.example.myproject.mapper.ReportListMapper;
import com.example.myproject.response.ResponseResult;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;

@ApplicationScoped
public class ReportListService {
    @Inject
    ReportListMapper reportListMapper;
    
    
    //查找所有
   public  Page<ReportList> selectList(int page ,int size){
       Pageable pageable = PageRequest.of(page-1, size);
       return reportListMapper.findAll(pageable);
   }
   
   //查找单个
    public ReportList getById(Long id){ return reportListMapper.getOne(id);}
    
    //删除单个
    public void deleteById(Long id){  reportListMapper.deleteById(id);}
    
    //更新
    public ReportList updateAndSave(ReportList reportList){ return reportListMapper.saveAndFlush(reportList);}
    
   
   
   
}
