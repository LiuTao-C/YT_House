package org.example.yt;

import io.quarkus.cache.CacheResult;
import jakarta.enterprise.context.ApplicationScoped;

import java.util.HashMap;
import java.util.Map;

@ApplicationScoped
public class CaffeineCache {
    
    //模拟数据存储
    private Map<String,String> database = new HashMap<>();
    
    
    public CaffeineCache(){
        database.put("key1","value1");
        database.put("key2","value2");
        
    }
    
    @CacheResult(cacheName = "my-cache")
    public String getCacheData(String key){
        
        return database.get(key);
    }
    
    public void updateData(String key,String value){
        database.put(key,value);
    }
}
