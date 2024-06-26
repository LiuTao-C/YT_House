package com.example.myproject.config;

import com.example.myproject.dto.Security;
import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Singleton;




import java.util.concurrent.TimeUnit;

@ApplicationScoped
public class CaffeineCache {
    
    @Singleton
    public Cache<String, Security> securityCache() {
        return Caffeine.newBuilder()
                .maximumSize(10_000)
                .expireAfterWrite(2, TimeUnit.HOURS)
                .build();
    }
    
}
