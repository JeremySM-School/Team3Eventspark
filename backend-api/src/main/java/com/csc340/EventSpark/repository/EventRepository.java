package com.csc340.EventSpark.repository;

import com.csc340.EventSpark.entity.*;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EventRepository extends JpaRepository<Event, Long> {
    
}
