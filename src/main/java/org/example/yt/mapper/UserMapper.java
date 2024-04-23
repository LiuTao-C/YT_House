package org.example.yt.mapper;


import org.example.yt.entity.UserList;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserMapper extends JpaRepository<UserList,Long> {

}
