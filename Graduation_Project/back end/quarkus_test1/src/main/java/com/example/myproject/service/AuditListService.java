package com.example.myproject.service;

import com.example.myproject.entity.AuditList;
import com.example.myproject.mapper.AuditListMapper;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 这里是做业务层
 * 多表查询的时候可以在这里处理业务逻辑
 * 比如： audit_list 里面需要 check_lit的数据
 * 可以查两张表， 然后聚合起来吧结果返回
 */
@ApplicationScoped
public class AuditListService {
    
    @Inject
    AuditListMapper auditListMapper;
    
    /**
     * 查詢全部
     * @return
     */
    public Page<AuditList> selectList(int page ,int size) {
        Pageable pageable = PageRequest.of(page - 1,size );
        return auditListMapper.findAll(pageable);
    }
    
    /**
     * 根据ID删除数据
     * @param id id
     */
    public void deleteById(Long id) {
         auditListMapper.deleteById(id);
    }
    
    /**
     * 根据ID更新数据
     * @param auditList
     * @return
     */
    public AuditList updateById(AuditList auditList) {
        return auditListMapper.saveAndFlush(auditList);
    }
    
    /**
     * 保存数据
     * @param auditList
     * @return
     */
    public AuditList save(AuditList auditList) {
        return auditListMapper.save(auditList);
    }
    
    //单个id查询
    public AuditList getById(Long id){  return auditListMapper.getOne(id);}
    
    
}
