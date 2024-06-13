package com.example.myproject.service;

import com.example.myproject.entity.ActionList;
import com.example.myproject.mapper.ActionListMapper;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

@ApplicationScoped
public class ActionListService {
    
    @Inject
    ActionListMapper actionListMapper;
    
    //查找一页
    public Page<ActionList> selectList(int page, int size){
        if (page <= 0) {
            throw new RuntimeException("非法入参");
        }
        Pageable pageable = PageRequest.of(page-1,size);
        return actionListMapper.findAll(pageable);
    }
    
    //根据id查找
    public ActionList getById(Long id) {return actionListMapper.getOne(id);}
    
    //根据id进行更新
    public ActionList updateById(ActionList actionList) {return actionListMapper.saveAndFlush(actionList);}
    
    //根据id删除
    public void deleteById(Long id) {  actionListMapper.deleteById(id);}

    //保存所有
    public ActionList save(ActionList actionList){ return actionListMapper.save(actionList);}
}
