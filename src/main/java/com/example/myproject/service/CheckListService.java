package com.example.myproject.service;



import com.example.myproject.entity.CheckList;
import com.example.myproject.mapper.CheckListMapper;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

import java.util.List;

/**
 * 这里是做业务层
 * 多表查询的时候可以在这里处理业务逻辑
 * 比如： audit_list 里面需要 check_lit的数据
 * 可以查两张表， 然后聚合起来吧结果返回
 */
@ApplicationScoped
public class CheckListService {
    
    @Inject
    CheckListMapper checkListMapper;
    
    /**
     * 查詢全部
     * @return
     */
    public List<CheckList> selectList() {
        return checkListMapper.findAll();
    }
    
    /**
     * 根据ID删除数据
     * @param id id
     */
    public void deleteById(Long id) {
        checkListMapper.deleteById(id);
    }
    
    /**
     * 根据ID更新数据
     * @param checklist
     * @return
     */
    public CheckList updateById(CheckList checklist) {
        return checkListMapper.saveAndFlush(checklist);
    }
    
    /**
     * 保存数据
     * @param checkList
     * @return
     */
    public CheckList save(CheckList checkList) {
        return checkListMapper.save(checkList);
    }
    //单个id查询
    public CheckList getById(Long id){  return checkListMapper.getOne(id);}
    
    public CheckList Add(CheckList checkList) {return checkListMapper.saveAndFlush(checkList);}
    
}

