package com.hotel.demo.service;

import com.hotel.demo.entity.StudentEntity;
import com.hotel.demo.repository.StudentRepository;
import org.apache.juli.logging.Log;
import org.apache.juli.logging.LogFactory;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class StudentService {

    Log log = LogFactory.getLog(StudentService.class);

    @Resource
    StudentRepository repository;

    @Cacheable(value = "student", key = "#id", unless = "#result == null")
    public StudentEntity get(long id) {
        log.info("load from database");
        return repository.findById(id).orElse(null);
    }

    @CachePut(value = "student", key = "#entity.id")
    public StudentEntity save(StudentEntity entity) {
        log.info("save to database");
        return repository.save(entity);
    }

    @CacheEvict(value = "student", key = "#entity.id")
    public void delete(StudentEntity entity) {
        log.info("delete from database");
        repository.delete(entity);
    }

    public Iterable<StudentEntity> all() {
        return repository.findAll();
    }

}