package com.csc340.EventSpark.service;

import com.csc340.EventSpark.entity.Review;
import com.csc340.EventSpark.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ReviewService {

    @Autowired
    private ReviewRepository reviewRepository;

    public Review createReview(Review review) {
        return reviewRepository.save(review);
    }

    public Optional<Review> getReviewById(Long id){
        return reviewRepository.findById(id);
    }

    public List<Review> getReviewsByBookingId(Long bookingId){
        return reviewRepository.findByBookingId(bookingId);
    }

    public Review updateReview(Long id, Review reviewDetails){
        return reviewRepository.findById(id).map(review -> {
            review.setStarRating(reviewDetails.getStarRating());
            return reviewRepository.save(review);
        }).orElseThrow(() -> new RuntimeException("Review not found"));
    }

    public void deleteReview(Long id){
        reviewRepository.deleteById(id);
    }
}
