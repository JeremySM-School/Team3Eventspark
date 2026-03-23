package com.csc340.EventSpark.repository;

import com.csc340.EventSpark.entity.BookRequest;
import com.csc340.EventSpark.entity.BookRequest.BookingStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface BookRequestRepository extends JpaRepository<BookRequest, Long> {
    @Query(value = "SELECT b.* FROM book_requests b WHERE b.provider_id = :providerId", nativeQuery = true)
    List<BookRequest> findByProviderId(Long providerId);

    @Query(value = "SELECT b.* FROM book_requests b WHERE b.event_id = :eventId", nativeQuery = true)
    List<BookRequest> findByEventId(Long eventId);

    List<BookRequest> findByStatus(BookingStatus status);
}