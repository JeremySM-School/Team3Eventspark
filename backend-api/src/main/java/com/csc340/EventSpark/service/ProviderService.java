package com.csc340.EventSpark.service;

import com.csc340.EventSpark.entity.*;
import com.csc340.EventSpark.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ProviderService {

    @Autowired
    private ProviderRepository providerRepo;
    @Autowired
    private EventPackageRepository packageRepo;
    @Autowired
    private BookRequestRepository bookRequestRepo;
    @Autowired
    private ReviewRepository reviewRepo;

    public Provider getProviderById(Long id) {
        return providerRepo.findById(id).orElseThrow(() -> new RuntimeException("Provider not found"));
    }

    public Provider createProvider(Provider provider) {
        provider.setRole(User.UserRole.PROVIDER); 
        return providerRepo.save(provider);
    }

    public Provider updateProvider(Long id, Provider updatedInfo) {
        Provider existing = getProviderById(id);
        existing.setBio(updatedInfo.getBio());
        existing.setName(updatedInfo.getName());
        existing.setServiceRadius(updatedInfo.getServiceRadius());
        existing.setZipCode(updatedInfo.getZipCode());
        return providerRepo.save(existing);
    }

    public EventPackage createPackage(Long providerId, EventPackage eventPackage) {
        Provider provider = getProviderById(providerId);
        eventPackage.setProvider(provider);
        return packageRepo.save(eventPackage);
    }

    public List<EventPackage> getProviderPackages(Long providerId) {
        return packageRepo.findByProvider(providerId);
    }

    public List<BookRequest> getProviderBookings(Long providerId) {
        return bookRequestRepo.findByProviderId(providerId);
    }

    public Review replyToReview(Long reviewId, String replyText) {
        Review review = reviewRepo.findById(reviewId).orElseThrow();
        review.setReplyText(replyText);
        return reviewRepo.save(review);
    }
}
