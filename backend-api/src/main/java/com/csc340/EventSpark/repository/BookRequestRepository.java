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

    @Query(value = "SELECT b.* FROM book_requests b JOIN events e ON b.event_id = e.id WHERE e.customer_id = :customerId", nativeQuery = true)
    List<BookRequest> findByCustomerId(Long customerId);

    @Query(value = "SELECT b.* FROM book_requests b JOIN booking_request_packages brp ON b.id = brp.book_request_id WHERE brp.service_package_id = :packageId", nativeQuery = true)
    List<BookRequest> findByPackageId(Long packageId);

    List<BookRequest> findByStatus(BookingStatus status);
}