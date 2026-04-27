package com.csc340.EventSpark.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.csc340.EventSpark.entity.Customer;
import com.csc340.EventSpark.entity.Review;
import com.csc340.EventSpark.repository.CustomerRepository;
import com.csc340.EventSpark.repository.MessageRepository;
import com.csc340.EventSpark.repository.ReviewRepository;

import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerUIController {

    @Autowired
    private CustomerRepository customerRepo;
    
    @Autowired
    private MessageRepository messageRepo;

    @Autowired
    private ReviewRepository reviewRepo;

    private final Long TEST_CUSTOMER_ID = 1L;

    @GetMapping("/dashboard")
    public String getDashboard(Model model) {
        Customer c = customerRepo.findById(TEST_CUSTOMER_ID).orElse(new Customer());
        model.addAttribute("customer", c);
        return "c_dashboard";
    }

    @GetMapping("/inbox")
    public String getInbox(@RequestParam(required = false, defaultValue = "1") Long threadId, Model model) {
        model.addAttribute("messages", messageRepo.findByThreadId(threadId));
        model.addAttribute("threadId", threadId);
        return "c_inbox";
    }

    @GetMapping("/reviews")
    public String getReviews(Model model) {
        List<Review> reviews = reviewRepo.findAll();
        model.addAttribute("reviews", reviews);
        return "c_reviews";
    }

    @PostMapping("/reviews/add")
    public String addReview(@RequestParam int starRating, @RequestParam String comment) {
        Review newReview = new Review();
        newReview.setStarRating(starRating);
        newReview.setComment(comment);
        // Note: In a real scenario, you'd associate a BookRequest here
        reviewRepo.save(newReview);
        return "redirect:/customer/reviews";
    }

    @GetMapping("/profile/edit")
    public String getEditProfile(Model model) {
        Customer c = customerRepo.findById(TEST_CUSTOMER_ID).orElse(new Customer());
        model.addAttribute("customer", c);
        return "edit_c_profile";
    }

    @PostMapping("/profile/edit")
    public String updateProfile(@RequestParam String firstName, @RequestParam String lastName, 
                                 @RequestParam String email, @RequestParam String phone) {
        Customer c = customerRepo.findById(TEST_CUSTOMER_ID).orElse(new Customer());
        c.setFirstName(firstName);
        c.setLastName(lastName);
        c.setEmail(email);
        c.setPhone(phone);
        customerRepo.save(c);
        return "redirect:/customer/dashboard";
    }
}