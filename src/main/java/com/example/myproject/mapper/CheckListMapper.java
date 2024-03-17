package com.example.myproject.mapper;
import com.example.myproject.entity.CheckList;
import org.springframework.data.jpa.repository.JpaRepository;
public interface CheckListMapper extends JpaRepository<CheckList,Long> {
}
