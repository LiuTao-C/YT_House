package org.example.myproject.service;


import org.example.myproject.entity.Fruits;
import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.transaction.Transactional;
import java.util.List;


@ApplicationScoped
public class FruitService {
        @Inject
        EntityManager entityManager;

        public List<Fruits> get() {
            return entityManager.createNamedQuery("Fruits.findAll", Fruits.class)
                    .getResultList();
        }

        public Fruits getSingle(Integer id) {
            return entityManager.find(Fruits.class, id);
        }

        @Transactional
        public void create(Fruits fruit) {
            entityManager.persist(fruit);
        }

        @Transactional
        public void update(Integer id, Fruits fruit) {
            Fruits entity = entityManager.find(Fruits.class, id);

            if (null!=entity) {
                entity.setName(fruit.getName());
            }
        }

        @Transactional
        public void delete(Integer id) {
            Fruits entity = entityManager.getReference(Fruits.class, id);

            if (null != entity) {
                entityManager.remove(entity);
            }
        }

}
