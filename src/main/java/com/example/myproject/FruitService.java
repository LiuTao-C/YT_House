package com.example.myproject;



import  jakarta.enterprise.context.ApplicationScoped;
import  jakarta.inject.Inject;
import  jakarta.persistence.EntityManager;
import  jakarta.transaction.Transactional;
import  jakarta.ws.rs.WebApplicationException;
import java.util.List;

@ApplicationScoped
public class FruitService {
    @Inject
    EntityManager entityManager;

    public List<Fruit> get() {
        return entityManager.createNamedQuery("Fruits.findAll", Fruit.class)
                .getResultList();
    }

    //获取单个Project
    public Fruit getById(Integer id) {
        Fruit entity = entityManager.find(Fruit.class, id);
        if (entity == null) {
            String info  = "project with id of " + id + " does not exist.";
            throw new WebApplicationException(info, 404);
        }
        return entity;
    }



//    @Transactional
//    public void create(Fruit fruit) {
//        entityManager.persist(fruit);
//    }
    @Transactional
    public Fruit add(Fruit project) {
        if (project.getId() == null) {
            String info = "Id was invalidly set on request.";

            throw new WebApplicationException(info, 422);
        }
        entityManager.persist(project);
        return project;
    }
    //带事务提交修改一条记录
    @Transactional
    public Fruit update(Fruit project) {
        if (project.getName() == null) {
            String info  = "project Name was not set on request.";
//            LOGGER.info(info);
            throw new WebApplicationException(info, 422);
        }

        Fruit entity = entityManager.find(Fruit.class, project.getId());
        if (entity == null) {
            String info  = "project with id  does not exist.";
//            LOGGER.info(info);
            throw new WebApplicationException(info, 404);
        }
        entity.setName(project.getName());
        return entity;
    }
    //
//    @Transactional
//    public void update(Integer id, Fruit fruit) {
//        Fruit entity = entityManager.find(Fruit.class, id);
//
//        if (null!=entity) {
//            entity.setName(fruit.getName());
//        }
//    }

    //带事务提交删除一条记录
    @Transactional
    public void delete( Integer id) {
        Fruit entity = entityManager.getReference(Fruit.class, id);
        if (entity == null) {
            String info  = "project with id of " + id + " does not exist.";
//            LOGGER.info(info);
            throw new WebApplicationException(info, 404);
        }
        entityManager.remove(entity);
        return ;
    }

//    @Transactional
//    public void delete(Integer id) {
//        Fruit entity = entityManager.getReference(Fruit.class, id);
//
//        if (null!=entity) {
//            entityManager.remove(entity);
//        }
//    }
}
