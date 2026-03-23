package com.csc340.EventSpark.repository;

import com.csc340.EventSpark.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {
    @Query(value = "SELECT r.* FROM reviews r WHERE r.booking_id = :bookingId", nativeQuery = true)
    List<Review> findByBookingId(Long bookingId);

    @Query(value = "SELECT r.* FROM reviews r JOIN book_requests br ON r.book_request_id = br.id WHERE br.event_id = :eventId", nativeQuery = true)
    List<Review> findByEventId(Long eventId);
}
