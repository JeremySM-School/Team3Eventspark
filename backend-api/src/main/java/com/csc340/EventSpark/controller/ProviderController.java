package com.csc340.EventSpark.controller;

import com.csc340.EventSpark.entity.*;
import com.csc340.EventSpark.service.ProviderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/providers")
public class ProviderController {

    @Autowired
    private ProviderService providerService;

    @PostMapping
    public Provider createProviderProfile(@RequestBody Provider provider) {
        return providerService.createProvider(provider);
    }

    @PutMapping("/{id}")
    public Provider modifyProviderProfile(@PathVariable Long id, @RequestBody Provider provider) {
        return providerService.updateProvider(id, provider);
    }

    @PostMapping("/{providerId}/packages")
    public EventPackage createServicePackage(@PathVariable Long providerId, @RequestBody EventPackage eventPackage) {
        return providerService.createPackage(providerId, eventPackage);
    }

    @GetMapping("/{providerId}/packages")
    public List<EventPackage> viewProviderPackages(@PathVariable Long providerId) {
        return providerService.getProviderPackages(providerId);
    }

    @GetMapping("/{providerId}/bookings")
    public List<BookRequest> viewCustomerRequests(@PathVariable Long providerId) {
        return providerService.getProviderBookings(providerId);
    }

    @PutMapping("/reviews/{reviewId}/reply")
    public Review replyToReview(@PathVariable Long reviewId, @RequestBody String replyText) {
        return providerService.replyToReview(reviewId, replyText);
    }

    // SRS Additions
    @PostMapping("/{providerId}/calendar/block")
    public Provider blockDate(@PathVariable Long providerId, @RequestBody String date) {
        Provider provider = providerService.getProviderById(providerId);
        provider.getBlockedDates().add(date);
        return providerService.updateProvider(providerId, provider);
    }

    @PostMapping("/{providerId}/gallery")
    public Provider addMediaToGallery(@PathVariable Long providerId, @RequestBody String imageUrl) {
        Provider provider = providerService.getProviderById(providerId);
        provider.getImageUrls().add(imageUrl);
        return providerService.updateProvider(providerId, provider);
    }

    @GetMapping("/{providerId}/analytics")
    public String getAnalytics(@PathVariable Long providerId) {
        Provider provider = providerService.getProviderById(providerId);
        return "Views: " + provider.getProfileViews() + ", Clicks: " + provider.getPackageClicks();
    }
}