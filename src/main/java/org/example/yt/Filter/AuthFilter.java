package org.example.yt.Filter;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.ext.Provider;

import jakarta.ws.rs.container.ContainerRequestContext;
import jakarta.ws.rs.container.ContainerRequestFilter;
import jakarta.ws.rs.container.ContainerResponseContext;
import jakarta.ws.rs.container.ContainerResponseFilter;
import org.example.yt.service.JwtService;

import java.io.IOException;
import java.lang.reflect.Type;

@Provider
@ApplicationScoped
public class AuthFilter  implements ContainerRequestFilter, ContainerResponseFilter {
    
    @Inject
    JwtService jwtService;
    
    @Override
    public void filter(ContainerRequestContext requestContext){
        //检查token
        String token= requestContext.getHeaderString("Authorization");
        if( token  == null || token.isEmpty()){        //响应过滤器中token不存在
               token = jwtService.generateToken(requestContext.getHeaders().getFirst("username"));  //生成token
               
        }else if (!isValidToken(token)){
            requestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).entity("Invalid token").build());
        }
        requestContext.setProperty("authenticated",true);       //验证完毕
        Boolean authenticated = (Boolean) requestContext.getProperty("authenticated");
        //验证完后传给下一个资源
        //todo  这个传递我不会写，待会再改
    }
    
    @Override
    public void filter(ContainerRequestContext requestContext,ContainerResponseContext responseContext){
        //响应过滤器中添加响应信息
        responseContext.getHeaders().add("X-Example-Header","Response processed by AuthFilter");
    }
     boolean isValidToken(String token){
        //判断token逻辑 先不写
            return true;
        }
        
 
     }

