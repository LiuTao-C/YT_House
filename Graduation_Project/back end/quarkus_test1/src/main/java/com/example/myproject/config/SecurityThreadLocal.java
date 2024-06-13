package com.example.myproject.config;


import com.example.myproject.dto.Security;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class SecurityThreadLocal {
    
    private static ThreadLocal<Security> USER_NAME_CONTEXT = new ThreadLocal<>();
    
    public static Security current() {
        return USER_NAME_CONTEXT.get();
    }
    
    public static void setCurrent(Security current) {
        USER_NAME_CONTEXT.set(current);
    }
    
    public static void clear() {
        USER_NAME_CONTEXT.remove();
    }
    
}
