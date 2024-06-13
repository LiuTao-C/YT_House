package com.example.myproject.service;


import java.util.HashSet;
import java.util.Set;

public class PathMatcher {
    public static boolean matches(Set<String> rolePerms, String requestPath) {
        for (String path : rolePerms) {
            // 将路径中的 ** 替换为 .*，表示匹配零个或多个路径段
            String regex = path.replaceAll("\\*\\*", ".*");
            // 对于正则表达式，加上 ^ 和 $ 表示匹配整个路径
            regex = "^" + regex + "$";
            // 使用 matches 方法进行正则匹配
            if (requestPath.matches(regex)) {
                return true;
            }
        }
        return false;
    }
    
    public static void main(String[] args) {
        // 示例权限集合
        Set<String> rolePerms = new HashSet<>();
        rolePerms.add("/demo/**");
        rolePerms.add("/check/**");
        rolePerms.add("/login");
        
        // 示例请求路径
        String requestPath = "/demo/1";
        
        // 检查请求路径是否匹配权限集合
        boolean matched = matches(rolePerms, requestPath);
        System.out.println("请求路径是否匹配权限集合：" + matched);
    }
}
