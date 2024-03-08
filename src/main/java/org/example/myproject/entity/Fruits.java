package org.example.myproject.entity;

import javax.persistence.Cacheable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.QueryHint;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
@Entity
@Table(name = "known_fruits")
@NamedQuery(name = "Fruits.findAll", query = "SELECT f FROM Fruits f ", hints = @QueryHint(name = "org.hibernate.cacheable", value = "true"))
@Cacheable


public class Fruits {
    @Id
    @SequenceGenerator(name = "fruitsSequence", sequenceName = "known_fruits_id_seq", allocationSize = 1, initialValue = 10)
    @GeneratedValue(generator = "fruitsSequence")
    private Integer id;
    @Column(length = 40,unique = true)
    private String name;
    public Fruits(){}
    public Fruits(String name){
        this.name = name;
    }

    public Integer getId() {
        return id;
    }
    public void setId(){
        this.id = id;
    }
    public String getName(){
        return name;
    }
    public  void setName(String name){
        this.name=name;
    }
}
