package com.csc340.EventSpark.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.csc340.EventSpark.entity.Provider;
import com.csc340.EventSpark.entity.ServicePackage;
import com.csc340.EventSpark.entity.BookRequest;
import com.csc340.EventSpark.repository.ServicePackageRepository;
import com.csc340.EventSpark.repository.ProviderRepository;
import com.csc340.EventSpark.repository.BookRequestRepository;

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

    // --- DASHBOARD ---
    @GetMapping("/dashboard")
    public String getDashboard(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        Provider p = providerRepo.findById(userId).orElse(new Provider());
        model.addAttribute("provider", p);
        
        // REAL NOTIFICATION BADGE: Count only "PENDING" requests for this provider
        List<BookRequest> allRequests = bookRequestRepo.findByProviderId(userId);
        long pendingCount = allRequests.stream()
            .filter(req -> req.getStatus() == BookRequest.BookingStatus.PENDING)
            .count();
            
        model.addAttribute("pendingCount", pendingCount);
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
        
        // Find the request, update it to APPROVED or REJECTED, and save it
        BookRequest request = bookRequestRepo.findById(requestId).orElse(null);
        if (request != null) {
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
            HttpSession session) {
        
        Long userId = (Long) session.getAttribute("userId");
        Provider p = providerRepo.findById(userId).orElseThrow();

        ServicePackage newPackage = new ServicePackage();
        newPackage.setTitle(title);
        newPackage.setDescription(description);
        newPackage.setPrice(price);
        newPackage.setStatus(ServicePackage.PackageStatus.ACTIVE); 
        newPackage.setCategory(ServicePackage.PackageCategory.OTHER); 
        newPackage.setProvider(p);

        packageRepo.save(newPackage);
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
            @RequestParam(required = false) List<String> category,
            HttpSession session) {
        
        Long userId = (Long) session.getAttribute("userId");
        Provider p = providerRepo.findById(userId).orElseThrow();
        
        p.setName(name); 
        p.setBio(bio);

        if (category != null) {
            p.setCategory(String.join(", ", category)); 
        } else {
            p.setCategory(""); 
        }
        
        providerRepo.save(p);
        return "redirect:/provider/dashboard";
    }
}