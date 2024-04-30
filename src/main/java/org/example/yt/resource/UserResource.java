package org.example.yt.resource;

import com.github.benmanes.caffeine.cache.Cache;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;

import org.example.yt.UserTable;
import org.example.yt.config.Constant;
import org.example.yt.dto.Security;
import org.example.yt.entity.LoginRequest;
import org.example.yt.response.ResponseResult;
import org.example.yt.service.TokenService;
import org.example.yt.service.UserService;


import jakarta.ws.rs.core.MediaType;

import java.util.Set;
import java.util.UUID;

@Path("login")
public class UserResource {
    
    @Inject
    UserService userService;
    
    @Inject
    Cache<String, Security> securityCache;
    
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult<String> login(LoginRequest user){
        
//        loginRequest:"LoginRequest(username=123,password=123)";
        
        //1.从请求中获得用户名和密码，然后再在数据库中查询，验证是否匹配
        //2.1如果验证匹配失败 则返回错误的响应 然后return;
        //2.2如果验证成功，则生成token并返回
        String username = user.getUsername();
        String password = user.getPassword();
        
        //生成token
        UserTable.IUser userInfo = userService.authenticate(username, password);
        if(userInfo != null){
            String token = UUID.randomUUID().toString();
            
            Security security = new Security();
            // TODO 設置security屬性的值
            Set<String> perms = Constant.PERMS.get(userInfo.getRole());
            security.setPerms(perms);
            
            // 登入时设置的用户信息： Caffine.set<token, Security, expire> = Map<String, Security>
            securityCache.put(token, security);
            
            // 加密 uuid 生成 token
            String tokenVal = TokenService.generateToken(token);
            return ResponseResult.success(tokenVal);
        }else{
            return  ResponseResult.notFound("not have  such user");
        }
    }
}
