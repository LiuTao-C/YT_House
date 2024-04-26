package org.example.yt.resource;

import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.Response;
import org.example.yt.entity.LoginRequest;
import org.example.yt.entity.UserList;
import org.example.yt.response.ResponseResult;
import org.example.yt.service.JwtService;
import org.example.yt.service.UserService;

import javax.ws.rs.core.Context;
import javax.ws.rs.core.HttpHeaders;
import jakarta.ws.rs.core.MediaType;
@Path("login")
public class UserResource {
    
    @Inject
    UserService userService;
    
    @Inject
    JwtService jwtService;
    
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public ResponseResult<String> login(LoginRequest loginRequest){
        
        //1.从请求中获得用户名和密码，然后再在数据库中查询，验证是否匹配
        //2.1如果验证匹配失败 则返回错误的响应 然后return;
        //2.2如果验证成功，则生成token并返回
        
        String username = loginRequest.getUsername();
        String password = loginRequest.getPassword();
        
        //生成token
        Long id = userService.authenticate(username,password);
        if(id != -1){
            //根据id生成token
            String token = jwtService.generateToken(id.toString());
            
            return ResponseResult.success(token);
        }else{
            return  ResponseResult.notFound("not have  such user");
        }
    }
}
