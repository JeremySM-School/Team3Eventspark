package com.csc340.EventSpark.controller;

import com.csc340.EventSpark.entity.Review;
import com.csc340.EventSpark.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/reviews")
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    @GetMapping("/customer/{customerId}")
    public String getCustomerReviews(@PathVariable Long customerId, Model model) {
        model.addAttribute("reviews", reviewService.getReviewsByCustomerId(customerId));
        model.addAttribute("customerId", customerId);
        return "Customer/c_reviews"; 
    }

    @PostMapping("/create")
    public String createReview(Review review) {
        reviewService.createReview(review);
        return "redirect:/reviews/customer/" + review.getCustomerId();
    }

    @GetMapping("/delete/{id}/{customerId}")
    public String deleteReview(@PathVariable Long id, @PathVariable Long customerId) {
        reviewService.deleteReview(id);
        return "redirect:/reviews/customer/" + customerId;
    }
}