package com.example.myproject.mapper;

import com.example.myproject.entity.ActionList;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ActionListMapper  extends JpaRepository<ActionList,Long> {
}
