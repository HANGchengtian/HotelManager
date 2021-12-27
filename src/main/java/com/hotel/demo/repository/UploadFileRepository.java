package com.hotel.demo.repository;

import com.hotel.demo.entity.UploadFileEntity;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface UploadFileRepository extends PagingAndSortingRepository<UploadFileEntity, Long> {
}