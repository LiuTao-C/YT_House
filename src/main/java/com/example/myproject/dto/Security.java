package com.example.myproject.dto;
import lombok.Data;


import java.util.HashSet;

import java.util.Set;

@Data
public class Security {
    private String username;
    private String role;
    private String department;
    // /index, /demo
    private Set<String> perms = new HashSet<>();
}

