package com.example.myproject.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;
//import lombok.Getter;
//import lombok.Setter;
@Data
@Entity
@Table(name = "user")
public class User implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column
    private String username;
    
    @Column
    private String password;
    
    @Column
    private String role;

}

