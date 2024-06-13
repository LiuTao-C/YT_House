package com.example.myproject.config;

import java.util.*;


public class Constant {
    
    /**
     * key： role, value: urls
     */
    public static final Map<String, Set<String>> PERMS = new HashMap<>() {{
        put("admin", new HashSet<>(List.of("/auditlist", "/auditlist/**",
                "/actionlist", "/actionlist/**",
                "/newreportview", "/newreportview/**",
                "/reportlist", "/reportlist/**",
                "/login",
                "/hazardlog","/hazardlog/**",
               "/support","/support/**",
                "/userlist/**","/userlist","/file/**",
                "/checklist/**", "/checklist",
                "/documentlist","/documentlist/**"
        )));
        put("user", new HashSet<>(List.of("/newaudti", "/auditlistview", "newactview", "/newreportview", "/login", "/neehazard", "/newsupporter")));
    }};
    
    public static String key = "woniucsdnvip8888"; // 16字节的密钥
    
}
