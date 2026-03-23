package com.csc340.EventSpark.repository;

import com.csc340.EventSpark.entity.Event;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface EventRepository extends JpaRepository<Event, Long> {
    @Query(value = "SELECT e.* FROM events e WHERE e.customer_id = :customerId", nativeQuery = true)
    List<Event> findByCustomerId(Long customerId);
}
