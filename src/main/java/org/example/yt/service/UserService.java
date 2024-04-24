package org.example.yt.service;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.Path;
import org.example.yt.entity.UserList;
import org.example.yt.mapper.UserMapper;

@ApplicationScoped
public class UserService {
    
    @Inject
    UserMapper userMapper;
    
    public UserList getById(Long id){
        return userMapper.getOne(id);
    }
    
    public UserList getByName(String userName){
        return userMapper.findByUsername(userName);
    }
    
    //根据用户信息是否匹配决定返回用户id 还是-1；
    public Long authenticate(String username,String password){
        UserList user = getByName(username);
        if(user.getPassword() != null && user.getPassword().equals(password)){
            return user.getId();
        }else{
            return -1L;
        }
    }

}
