package com.csc340.EventSpark.repository;

import com.csc340.EventSpark.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {
    @Query(value = "SELECT r.* FROM reviews r WHERE r.book_request_id = :bookRequestId", nativeQuery = true)
    List<Review> findByBookRequestId(Long bookRequestId);
}
