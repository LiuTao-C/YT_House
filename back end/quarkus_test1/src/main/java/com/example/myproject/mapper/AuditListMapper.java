package com.example.myproject.mapper;

import com.example.myproject.entity.AuditList;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 得益于Jpa强大的封装，一些简单的增删改已经内置在上层实现
 * 处理一些复杂的多表查询可以在这里写SQL
 *
 *     List<T> findAll();
 *
 *     List<T> findAll(Sort var1);
 *
 *     List<T> findAllById(Iterable<ID> var1);
 *
 *     <S extends T> List<S> saveAll(Iterable<S> var1);
 *
 *     void flush();
 *
 *     <S extends T> S saveAndFlush(S var1);
 *
 *     void deleteInBatch(Iterable<T> var1);
 *
 *     void deleteAllInBatch();
 *
 *     T getOne(ID var1);
 *
 *     <S extends T> List<S> findAll(Example<S> var1);
 *
 *     <S extends T> List<S> findAll(Example<S> var1, Sort var2);
 *
 *
 */
public interface AuditListMapper extends JpaRepository<AuditList, Long> {
    
    AuditList findByCode(String code);
    
}
