package com.example.myproject.resource;

import com.example.myproject.config.Constant;
import com.example.myproject.entity.User;
import com.example.myproject.response.ResponseResult;
import com.example.myproject.service.EncryptService;
import com.github.benmanes.caffeine.cache.Cache;
import com.example.myproject.dto.Security;
import com.example.myproject.service.UserService;
import jakarta.inject.Inject;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.MediaType;

import java.util.Set;
import java.util.UUID;

@Path("login")
public class LoginResource {
    
    @Inject
    UserService userService;
    
    @Inject
    Cache<String, Security> securityCache;
    
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult<String> login(User user){
        
        String username = user.getUsername();
        String password = user.getPassword();
        
        //生成token
        User userinfo = userService.authenticate(username,password);
        if(userinfo != null){
            String token = UUID.randomUUID().toString();
            
            Security security = new Security();
            
            Set<String> perms = Constant.PERMS.get(userinfo.getRole());
            
            security.setPerms(perms);
            security.setRole(userinfo.getRole());
            //未加密的token 存入cache
            securityCache.put(token,security);
            
            //加密token
            String encryptToken = EncryptService.generateToken(token);
            return ResponseResult.success(encryptToken);
        }else{
            return ResponseResult.notFound("not have such user");
        }
        
    }
    
}
