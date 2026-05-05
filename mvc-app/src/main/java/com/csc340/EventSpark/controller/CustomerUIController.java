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
import com.csc340.EventSpark.service.EventService;
import com.csc340.EventSpark.entity.Event;

import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
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


    @Autowired
    private EventService eventService;



    // --- DASHBOARD ---
    @GetMapping("/dashboard")
    public String getDashboard(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null || !"CUSTOMER".equals(session.getAttribute("userRole"))) return "redirect:/login";

        Customer c = customerRepo.findById(userId).orElse(new Customer());
        model.addAttribute("customer", c);
        return "c_dashboard";
    }

    // --- INBOX ---
    @GetMapping("/inbox")
    public String getInbox(@RequestParam(required = false, defaultValue = "1") Long threadId, Model model, HttpSession session) {
        if (session.getAttribute("userId") == null) return "redirect:/login";

        model.addAttribute("messages", messageRepo.findByThreadId(threadId));
        model.addAttribute("threadId", threadId);
        return "c_inbox";
    }

    // --- REVIEWS ---
    @GetMapping("/reviews")
    public String getReviews(Model model, HttpSession session) {
        if (session.getAttribute("userId") == null) return "redirect:/login";

        // Note: Ideally this should fetch reviews specific to this customer, 
        // but keeping it as findAll() to match current logic
        List<Review> reviews = reviewRepo.findAll();
        model.addAttribute("reviews", reviews);
        return "c_reviews";
    }

    @PostMapping("/reviews/add")
    public String addReview(@RequestParam int starRating, @RequestParam String comment, HttpSession session) {
        if (session.getAttribute("userId") == null) return "redirect:/login";

        Review newReview = new Review();
        newReview.setStarRating(starRating);
        newReview.setComment(comment);
        reviewRepo.save(newReview);
        return "redirect:/customer/reviews";
    }

    // --- EDIT PROFILE ---
    @GetMapping("/profile/edit")
    public String getEditProfile(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        Customer c = customerRepo.findById(userId).orElse(new Customer());
        model.addAttribute("customer", c);
        return "edit_c_profile";
    }

    @PostMapping("/profile/edit")
    public String updateProfile(
            @RequestParam String firstName, 
            @RequestParam String lastName, 
            @RequestParam String email, 
            @RequestParam String phone,
            HttpSession session) {
        
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        Customer c = customerRepo.findById(userId).orElseThrow();
        
        c.setFirstName(firstName);
        c.setLastName(lastName);
        c.setEmail(email);
        c.setPhone(phone);
        c.setNotificationsEnabled(true); 
        
        customerRepo.save(c);
        return "redirect:/customer/dashboard";
    }

    // --- EVENTS ---
    @GetMapping("/events/new")
    public String showCreateEventForm(HttpSession session) {
        if (session.getAttribute("userId") == null) return "redirect:/login";
        return "create_event"; 
    }

    @PostMapping("/events/new")
    public String createEvent(
            @RequestParam String eventName, 
            @RequestParam String eventDate,
            @RequestParam String eventLocation,
            HttpSession session) {
        
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";
        
        Event newEvent = new Event(); 
        newEvent.setEventName(eventName);
        
        if (eventDate != null && !eventDate.isEmpty()) {
            newEvent.setEventDate(LocalDateTime.parse(eventDate));
        }
        
        newEvent.setLocation(eventLocation); 
        newEvent.setStatus("Planning");

        // Associate with the dynamically logged-in Customer
        Customer c = customerRepo.findById(userId).orElseThrow();
        newEvent.setCustomer(c);

        eventService.createEvent(newEvent);
        return "redirect:/customer/dashboard";
    }

}
   

