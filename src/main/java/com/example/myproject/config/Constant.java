package com.example.myproject.config;

import java.util.*;

import static com.example.myproject.service.EncryptService.getIV;


public class Constant {
    
    /**
     * key： role, value: urls
     */
    public static final Map<String, Set<String>> PERMS =new HashMap<>(){{
        put("admin", new HashSet<>(List.of("/newaudti", "/auditlistview","newactview","/newreportview",
                "/login","/newhazard","/newsupporter","/checklistview","/checkactview","/checkreportview","/checkhazardview","/demo/**","/demo")));
        put("user", new HashSet<>(List.of("/newaudti", "/auditlistview","newactview","/newreportview","/login","/neehazard","/newsupporter")));
    }};

    public static String key  = "woniucsdnvip8888"; // 16字节的密钥
    public static String iv  = getIV();
    
}
