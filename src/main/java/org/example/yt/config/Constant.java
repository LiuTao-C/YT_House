package org.example.yt.config;

import java.util.*;


import static org.example.yt.service.TokenService.getIV;

public class Constant {
    
    /**
     * key： role, value: urls
     */
    public static final Map<String, Set<String>> PERMS =new HashMap<>(){{
        put("admin", new HashSet<>(List.of("/newaudti", "/auditlistview","newactview","/newreportview",
                "/login","/newhazard","/newsupptor","/checklistview","/checkactview","/checkreportview","/checkhazardview")));
        put("user", new HashSet<>(List.of("/newaudti", "/auditlistview","newactview","/newreportview","/login","/neehazard","/newsupptor")));
    }};
    public static String key  = "woniucsdnvip8888"; // 16字节的密钥
    public static String iv  = getIV();
    
}
