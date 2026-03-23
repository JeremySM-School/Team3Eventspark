package com.csc340.EventSpark.repository;

import com.csc340.EventSpark.entity.*;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface BookRequestRepository extends JpaRepository<BookRequest, Long> {
    List<BookRequest> findByProviderId(Long providerId);
}