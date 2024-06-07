package com.example.myproject.filter;


import com.example.myproject.config.SecurityThreadLocal;
import com.example.myproject.dto.Security;
import com.example.myproject.service.EncryptService;
import com.example.myproject.service.PathMatcher;
import com.github.benmanes.caffeine.cache.Cache;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.container.*;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.ext.Provider;

import java.util.Collections;
import java.util.Set;

import static com.example.myproject.config.Constant.PERMS;

@Provider
@ApplicationScoped
@PreMatching
public class AuthFilter implements ContainerRequestFilter, ContainerResponseFilter {


//    private static final String[] whitelist_path = {"/auditlistview", "/actlistview", "/reportlistview/", "/login"};
    
    @Inject
    Cache<String, Security> securityCache;
    
    
    // 1. request SET（User）
    // 2. resource -> 记录用户操作日志（真实操作用户） GET（User）
    // 3. response Remove
    
    // TODO
    // 1.1 获取token, path， 校验路径白名单
    // 1.2 校验token值， 非空， token合法性 -》 用户信息 (Caffine<token, Security> 有， 代表用户没过期，没有， 说明用户token过期)
    // 1.3 校验用户权限 - 校验登入信息
    // 1.4 当前操作人信息确定是本系统的用户。 SecurityThreadLocal.setCruuent(Security)
    // 1.5 刷新token, 先失效，后设置值 （代码可以参考登入时的）
    
    // 2. resource Security user = DemoThreadLocal.getUser()
    
    // 3. DemoThreadLocal.remove()
    
    
    // Map   put get key==
    // 1.2.1 密文解析原token, Caffine.get(token) 用户信息 Security (token是随机uuid)
    @Override
    public void filter(ContainerRequestContext requestContext) {
        
        //遍历白名单路径
        String requestPath = requestContext.getUriInfo().getPath();
        System.out.println("path is " + requestPath);
        
        
        String token = requestContext.getHeaderString("Authorization");
        if (token != null) {
            if (!token.isEmpty()) {
                // TODO 校验， 解析 ——》 真实token
                token = EncryptService.decryptToken(token);
                
                if (token.isEmpty()) {
                    requestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).entity("无效的token").build());
                    return;
                }
                
                // 获取当前用户息
                Security security = securityCache.getIfPresent(token);
                if (security == null) {
                    requestContext.abortWith(Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("用户信息登入失效，请重新登入").build());
                    return;
                }
                
                // 校验用户权限
                boolean flag = false;
                Set<String> perms = security.getPerms();
                String role = security.getRole();
                System.out.println("路径" + perms);
                System.out.println("权限" + security.getRole());
                
                Set<String> rolePerms = PERMS.getOrDefault(role, Collections.emptySet());
                System.out.println("角色路径" + rolePerms);
                if (PathMatcher.matches(rolePerms, requestPath)) {
                    flag = true;
                }
                
                if (!flag) {
                    requestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).entity("该用户暂无该权限").build());
                    return;
                }
                SecurityThreadLocal.setCurrent(security);
                
                // 刷新token
                securityCache.invalidate(token);
                securityCache.put(token, security);
            }
        } else {
            return;
        }
    }
    @Override
    public void filter(ContainerRequestContext requestContext, ContainerResponseContext responseContext) {
        SecurityThreadLocal.clear();
    }
}