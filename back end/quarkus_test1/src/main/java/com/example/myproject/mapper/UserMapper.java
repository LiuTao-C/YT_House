package com.example.myproject.mapper;
import com.example.myproject.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserMapper  extends JpaRepository<User,Long>{

    User findByUsername(String username);
    
}
