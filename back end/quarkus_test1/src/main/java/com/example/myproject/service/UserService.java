package com.example.myproject.service;


import com.example.myproject.entity.User;
import com.example.myproject.mapper.UserMapper;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;


/**
 * 这里是做业务层
 * 多表查询的时候可以在这里处理业务逻辑
 * 比如： audit_list 里面需要 check_lit的数据
 * 可以查两张表， 然后聚合起来吧结果返回
 */
@ApplicationScoped
public class UserService {
    
    @Inject
    UserMapper userMapper;
    

    /**
     * 查詢全部
     *
     * @return
     */
    public Page<User> selectList(int page, int size) {
        Pageable pageable = PageRequest.of(page - 1, size);
        return userMapper.findAll(pageable);
    }
    
    /**
     * 根据ID删除数据
     *
     * @param id id
     */
    public void deleteById(Long id) {
        userMapper.deleteById(id);
    }
    
    /**
     * 根据ID更新数据
     *
     * @param user
     * @return
     */
    public User updateById(User user) {
        return userMapper.saveAndFlush(user);
    }
    
    /**
     * 保存数据
     *
     * @param user
     * @return
     */
    public User save(User user) {
        return userMapper.save(user);
    }
    
    //单个id查询
    public User getById(Long id) {
        return userMapper.getOne(id);
    }
    
    public User add(User user) {
        return userMapper.saveAndFlush(user);
    }
    
    
    //登录模块
    public User authenticate(String username, String password) {
        User user = userMapper.findByUsername(username);
        
        String pawd = EncryptService.decryptPawd( user.getPassword());
        
        System.out.println("用戶" + user);
        System.out.println("密碼是A+" + pawd);
        if(pawd != null){
            String pawd1 = EncryptService.decryptPawd( user.getPassword());
            System.out.println("密碼是"+pawd);
            if(pawd.equals(password)){ return user;}
        }else{
            return null;
        }
        return null;
    }
}