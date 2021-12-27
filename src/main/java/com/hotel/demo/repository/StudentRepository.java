package com.hotel.demo.repository;

import com.hotel.demo.entity.StudentEntity;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface StudentRepository extends PagingAndSortingRepository<StudentEntity, Long> {


}