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
public String updateProfile(@RequestParam String firstName, 
                             @RequestParam String lastName, 
                             @RequestParam String email, 
                             @RequestParam String phone) {
    // 1. Fetch Jeremy (ID: 1)
    Customer c = customerRepo.findById(TEST_CUSTOMER_ID).orElse(new Customer());
    
    // 2. Map the text fields
    c.setFirstName(firstName);
    c.setLastName(lastName);
    c.setEmail(email);
    c.setPhone(phone);
    
    // 3. Force notifications to '1' by default
    c.setNotificationsEnabled(true); 
    
    // 4. Save back to Neon
    customerRepo.save(c);
    
    return "redirect:/customer/dashboard";
}

@GetMapping("/events/new")
public String showCreateEventForm() {
    return "create_event"; 
}

@PostMapping("/events/new")
public String createEvent(@RequestParam String eventName, 
                          @RequestParam String eventDate,
                          @RequestParam String eventLocation) {
    
    Event newEvent = new Event(); 
    newEvent.setEventName(eventName);
    
    
    if (eventDate != null && !eventDate.isEmpty()) {
        newEvent.setEventDate(LocalDateTime.parse(eventDate));
    }
    
    newEvent.setLocation(eventLocation); 
    newEvent.setStatus("Planning");

    // Associate with Jeremy (ID: 1)
    Customer c = customerRepo.findById(TEST_CUSTOMER_ID).orElse(new Customer());
    newEvent.setCustomer(c);


    eventService.createEvent(newEvent);

    return "redirect:/customer/dashboard";
}
}