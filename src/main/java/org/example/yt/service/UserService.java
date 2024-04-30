package org.example.yt.service;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

import org.example.yt.UserTable;


@ApplicationScoped
public class UserService {
    
    @Inject
    UserTable userTable;
    
    public UserTable.IUser getById(Integer id){
        return userTable.getById(id);
    }
    
    public UserTable.IUser getByName(String userName){
        return userTable.getByName(userName);
    }
    
    //根据用户信息是否匹配决定返回用户id 还是-1；
    public UserTable.IUser authenticate(String username,String password){
        UserTable.IUser user = getByName(username);
//        password = endecoder(password);
        if(user != null && user.getPassword().equals(password)){
            return user;
        }else{
            return null;
        }
    }

}
