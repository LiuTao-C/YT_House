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
    

}
