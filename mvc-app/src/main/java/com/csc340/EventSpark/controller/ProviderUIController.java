package com.csc340.EventSpark.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.csc340.EventSpark.entity.Provider;
import com.csc340.EventSpark.entity.Review;
import com.csc340.EventSpark.entity.ServicePackage;
import com.csc340.EventSpark.entity.BookRequest;
import com.csc340.EventSpark.entity.Conversation;
import com.csc340.EventSpark.repository.ServicePackageRepository;
import com.csc340.EventSpark.repository.ProviderRepository;
import com.csc340.EventSpark.repository.ReviewRepository;
import com.csc340.EventSpark.repository.BookRequestRepository;
import com.csc340.EventSpark.repository.ConversationRepository;
import com.csc340.EventSpark.repository.MessageRepository;
import com.csc340.EventSpark.entity.Message;

import jakarta.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/provider")
public class ProviderUIController {

    @Autowired
    private ServicePackageRepository packageRepo;

    @Autowired
    private ProviderRepository providerRepo;

    @Autowired
    private BookRequestRepository bookRequestRepo;

    @Autowired
    private ConversationRepository conversationRepo;

    @Autowired
    private MessageRepository messageRepo;

    @Autowired
    private ReviewRepository reviewRepo;

    // --- DIRECT MESSAGING ---
    @GetMapping("/messages")
    public String getMessages(@RequestParam(required = false) Long threadId, Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        List<Conversation> threads = conversationRepo.findByProviderId(userId);
        model.addAttribute("threads", threads);

        if (threadId == null && !threads.isEmpty()) {
            threadId = threads.get(0).getId();
        }

        if (threadId != null) {
            model.addAttribute("messages", messageRepo.findByThreadId(threadId));
            model.addAttribute("currentThreadId", threadId);
        }

        model.addAttribute("currentUserId", userId);
        return "p_messages";
    }

    @PostMapping("/messages/send")
    public String sendProviderMessage(@RequestParam Long threadId, @RequestParam String content, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        // Fetch the actual objects from the database
        Provider sender = providerRepo.findById(userId).orElseThrow();
        Conversation thread = conversationRepo.findById(threadId).orElseThrow();

        Message newMessage = new Message();
        newMessage.setContent(content);
        newMessage.setSender(sender); // Set the object, not the ID!
        newMessage.setThread(thread); // Set the object, not the ID!
        messageRepo.save(newMessage);

        return "redirect:/provider/messages?threadId=" + threadId;
    }

    // --- DASHBOARD ---
    @GetMapping("/dashboard")
    public String getDashboard(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        Provider p = providerRepo.findById(userId).orElse(new Provider());
        model.addAttribute("provider", p);
        
        List<BookRequest> allRequests = bookRequestRepo.findByProviderId(userId);
        
        // 1. Pending Notification Badge
        long pendingCount = allRequests.stream().filter(req -> req.getStatus() == BookRequest.BookingStatus.PENDING).count();
        model.addAttribute("pendingCount", pendingCount);

        // 2. Upcoming Gigs (Approved Requests)
        long upcomingGigs = allRequests.stream().filter(req -> req.getStatus() == BookRequest.BookingStatus.APPROVED).count();
        model.addAttribute("upcomingGigs", upcomingGigs);

        // 3. Total Revenue (Sum of approved request prices)
        double totalRevenue = allRequests.stream()
            .filter(req -> req.getStatus() == BookRequest.BookingStatus.APPROVED)
            .mapToDouble(BookRequest::getTotalPrice)
            .sum();
        model.addAttribute("totalRevenue", totalRevenue);

        // 4. Send the recent requests to the dashboard activity feed
        // Sorts by newest first, limits to top 5
        List<BookRequest> recentActivity = new ArrayList<>(allRequests);
        recentActivity.sort((a, b) -> b.getCreatedAt().compareTo(a.getCreatedAt()));
        model.addAttribute("recentActivity", recentActivity.size() > 5 ? recentActivity.subList(0, 5) : recentActivity);

        return "p_dashboard";
    }

    // --- USE CASE 4: INBOX & BOOKING REQUESTS ---
    @GetMapping("/inbox")
    public String getInbox(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        // Pass the requests and the pending count to the view
        List<BookRequest> requests = bookRequestRepo.findByProviderId(userId);
        model.addAttribute("requests", requests);
        
        long pendingCount = requests.stream()
            .filter(req -> req.getStatus() == BookRequest.BookingStatus.PENDING)
            .count();
        model.addAttribute("pendingCount", pendingCount);

        return "p_inbox";
    }

    @PostMapping("/inbox/update")
    public String updateRequestStatus(
            @RequestParam Long requestId,
            @RequestParam String newStatus,
            HttpSession session) {
        
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login"; // SECURITY CHECK
        
        // Find the request, update it to APPROVED or REJECTED, and save it
        BookRequest request = bookRequestRepo.findById(requestId).orElse(null);
        
        // SECURITY CHECK: Ensure this provider actually owns the request they are trying to update
        if (request != null && request.getProvider().getId().equals(userId)) {
            request.setStatus(BookRequest.BookingStatus.valueOf(newStatus));
            bookRequestRepo.save(request);
        }
        
        return "redirect:/provider/inbox";
    }

    // --- USE CASE 1: PACKAGES ---
    @GetMapping("/packages")
    public String getPackages(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        // Only load packages for THIS logged-in provider
        model.addAttribute("packageList", packageRepo.findByProviderId(userId));
        return "packages";
    }

    @PostMapping("/packages/new")
    public String createNewPackage(
            @RequestParam String title,
            @RequestParam String description,
            @RequestParam Double price,
            @RequestParam String category, // NEW: Catches the dropdown value
            HttpSession session) {
        
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login"; 
        
        Provider p = providerRepo.findById(userId).orElseThrow();

        ServicePackage newPackage = new ServicePackage();
        newPackage.setTitle(title);
        newPackage.setDescription(description);
        newPackage.setPrice(price);
        newPackage.setStatus(ServicePackage.PackageStatus.ACTIVE); 
        
        // Convert the HTML String into your specific Java Enum safely
        try {
            newPackage.setCategory(ServicePackage.PackageCategory.valueOf(category.toUpperCase())); 
        } catch (IllegalArgumentException e) {
            newPackage.setCategory(ServicePackage.PackageCategory.OTHER); // Fallback if it fails
        }
        
        newPackage.setProvider(p);

        packageRepo.save(newPackage);
        return "redirect:/provider/packages";
    }

    @PostMapping("/packages/delete")
    public String deletePackage(@RequestParam Long packageId, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        // Security check: Make sure they own the package before deleting it
        ServicePackage pkg = packageRepo.findById(packageId).orElse(null);
        if (pkg != null && pkg.getProvider().getId().equals(userId)) {
            packageRepo.delete(pkg);
        }
        
        return "redirect:/provider/packages";
    }

    // --- USE CASE 2: EDIT PROFILE ---
    @GetMapping("/profile/edit")
    public String getEditProfile(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        Provider p = providerRepo.findById(userId).orElse(new Provider());
        model.addAttribute("provider", p);
        return "edit_p_profile";
    }

    @PostMapping("/profile/edit")
    public String updateProfile(
            @RequestParam String name,
            @RequestParam String bio,
            @RequestParam(required = false) String zipCode,
            @RequestParam(required = false) Integer serviceRadius,
            @RequestParam(required = false) List<String> category,
            HttpSession session) {
        
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login"; 
        
        Provider p = providerRepo.findById(userId).orElseThrow();
        p.setName(name); 
        p.setBio(bio);
        p.setZipCode(zipCode);
        if (serviceRadius != null) p.setServiceRadius(serviceRadius);

        if (category != null) {
            p.setCategory(String.join(", ", category)); 
        } else {
            p.setCategory(""); 
        }
        
        providerRepo.save(p);
        return "redirect:/provider/dashboard";
    }

    // --- REVIEWS & FAN LOVE ---
    @GetMapping("/reviews")
    public String getProviderReviews(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        // Fetch all reviews where this provider was reviewed
        // (Assuming Review entity has a getProvider() method, if not we can use findAll for the MVP)
        List<Review> reviews = reviewRepo.findAll().stream()
            .filter(r -> r.getBookRequest() != null && 
                         r.getBookRequest().getProvider() != null && 
                         r.getBookRequest().getProvider().getId().equals(userId))
            .toList();
            
        model.addAttribute("reviews", reviews);
        return "p_reviews";
    }

    @PostMapping("/reviews/reply")
    public String replyToReview(@RequestParam Long reviewId, @RequestParam String replyText, HttpSession session) {
        if (session.getAttribute("userId") == null) return "redirect:/login";

        Review review = reviewRepo.findById(reviewId).orElse(null);
        if (review != null) {
            review.setReplyText(replyText); // Save the provider's response
            reviewRepo.save(review);
        }
        return "redirect:/provider/reviews";
    }

    @GetMapping("/calendar")
    public String getCalendar(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        // Fetch only APPROVED requests to show on the schedule
        List<BookRequest> approvedGigs = bookRequestRepo.findByProviderId(userId).stream()
            .filter(req -> req.getStatus() == BookRequest.BookingStatus.APPROVED)
            .toList();
            
        model.addAttribute("gigs", approvedGigs);
        return "calendar";
    }

    @GetMapping("/profile")
    public String getProfile(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";
        
        Provider p = providerRepo.findById(userId).orElseThrow();
        model.addAttribute("provider", p);
        return "p_profile";
    }
}