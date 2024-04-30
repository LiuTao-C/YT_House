package org.example.yt.Filter;

import com.github.benmanes.caffeine.cache.Cache;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.container.*;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.ext.Provider;
import org.example.yt.config.SecurityThreadLocal;
import org.example.yt.dto.Security;
import org.example.yt.service.TokenService;

import java.util.Set;

@Provider
@ApplicationScoped
@PreMatching
public class AuthFilter implements ContainerRequestFilter, ContainerResponseFilter {


//    private static final String[] whitelist_path = {"/auditlistview", "/actlistview", "/reportlistview/", "/login"};
    
    @Inject
    Cache<String, Security> securityCache;
    
    @Override
    public void filter(ContainerRequestContext requestContext) {
        
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
        
        //遍历白名单路径
        String requestPath = requestContext.getUriInfo().getPath();
        System.out.println("path is " + requestPath);

//        // /index， /user/list?page=5, /**
//        for (String path : whitelist_path) {
//            if (requestPath.startsWith(path)) {
//                return;
//            }
//        }
        
        //检查token
        String token = requestContext.getHeaderString("Authorization");
        if(token != null) {
            // TODO 校验， 解析 ——》 真实token
            token = TokenService.decryptToken(token);
            
            if (token.isEmpty()) {
                requestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).entity("无效的token").build());
                return;
            }
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
        for (String path : perms) {
            if (requestPath.startsWith(path)) {
                flag = true;
            }
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
    
    
    @Override
    public void filter(ContainerRequestContext requestContext, ContainerResponseContext responseContext) {
        SecurityThreadLocal.clear();
    }
    
    
    boolean isValidToken(String token) {
        
        //token 为空
        if (token == null) {
            return false;
        }
        //token不为空
        return true;
        
        
    }
}
