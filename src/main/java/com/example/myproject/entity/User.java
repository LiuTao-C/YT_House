package com.example.myproject.entity;

import jakarta.persistence.*;
import java.io.Serializable;
//import lombok.Getter;
//import lombok.Setter;

@Entity
@Table(name = "user")
public class User implements Serializable {
    
    @Id
    private Long id;
    
    @Column
    private String name;
    
    @Column
    private String password;
    
    @Column
    private String role;
    

    
    @Column(name = "company_id")
    private Integer companyId;
    

    
    @Column(name = "department_id")
    private Integer departmentId;
    
    // TODO setter getter 把Setter和Getter补充完， 可以用lombok
    
    
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getName(){ return name;}
    
    public void setName(String name){ this.name = name;}
    
    public String getPassword(){ return password;}
    public void setType(String password){ this.password = password;}
    
    public String getRole(){ return role;}
    public void setRole(String scope){ this.role = role;}
    
    public Integer getDepartmentId(){ return departmentId;}
    public void setDepartmentId(Integer departmentId){ this.departmentId = departmentId;}
    
    public Integer getCompanyId(){ return companyId;}
    public void setCompanyId(Integer companyId){ this.companyId = companyId;}
    
}

