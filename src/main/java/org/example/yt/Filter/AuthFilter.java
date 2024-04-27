package org.example.yt.Filter;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.container.*;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.ext.Provider;

import org.example.yt.service.JwtService;
import org.example.yt.service.TokenService;

import java.io.IOException;
import java.lang.reflect.Type;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashSet;

@Provider
@ApplicationScoped
@PreMatching
public class AuthFilter  implements ContainerRequestFilter, ContainerResponseFilter {
    
    
    private static final String []whitelist_path = {"/auditlistview","/actlistview","/reportlistview"};

    
    @Override
    public void filter(ContainerRequestContext requestContext){
        
        //遍历白名单路径
        String requestPath = requestContext.getUriInfo().getPath();
        System.out.println("path is "+requestPath);
        for(String path : whitelist_path){
            if(requestPath.startsWith(path)){
                return;
            }
        }
        
        //检查token
        String token= requestContext.getHeaderString("Authorization");
        if( token  == null || token.isEmpty() ){        //响应过滤器中token不存在或者无效
            requestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).entity("token is null").build());
            return;
            
        }else if (!isValidToken(token)){
            requestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).entity("Invalid token").build());
            return;
        }else{
            return;
        }
    }
    
    
    @Override
    public void filter(ContainerRequestContext requestContext,ContainerResponseContext responseContext){
        //响应过滤器中添加响应信息
        responseContext.getHeaders().add("X-Example-Header","Response processed by AuthFilter");
    }
     boolean isValidToken(String token){
         String token_copy = TokenService.decryptToken(token);
         System.out.println("检查token是否有效");
            String []parm = token_copy.split("@");
            String userId = parm[0];
            String userTime = parm[1];  //过期时间
         
             // 定义日期时间格式化器
             DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
             
             // 将字符串转换为 LocalDateTime
             LocalDateTime expiryTime = LocalDateTime.parse(userTime, formatter);
             //当前时间
             LocalDateTime localDateTime = LocalDateTime.now();
                if (localDateTime.isBefore(expiryTime)){    //没有过期
                    System.out.println("没有过期");
                    return true;
                }
                System.out.println("过期了");
                return false;
            }
        
 
     }

