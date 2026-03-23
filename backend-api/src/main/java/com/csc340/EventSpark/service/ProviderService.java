package com.csc340.EventSpark.service;

import com.csc340.EventSpark.entity.Provider;
import com.csc340.EventSpark.repository.ProviderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProviderService {

    @Autowired
    private ProviderRepository providerRepository;

    public Provider createProvider(Provider provider) {
        return providerRepository.save(provider);
    }

    public Optional<Provider> getProviderById(Long id) {
        return providerRepository.findById(id);
    }

    public List<Provider> getAllProviders() {
        return providerRepository.findAll();
    }

    public Provider getProviderByEmail(String email) {
        return providerRepository.findByEmail(email);
    }

    public Provider updateProvider(Long id, Provider providerDetails) {
        return providerRepository.findById(id).map(provider -> {
            if (providerDetails.getName() != null) provider.setName(providerDetails.getName());
            if (providerDetails.getCategory() != null) provider.setCategory(providerDetails.getCategory());
            if (providerDetails.getBio() != null) provider.setBio(providerDetails.getBio());
            if (providerDetails.getServiceRadius() != null) provider.setServiceRadius(providerDetails.getServiceRadius());
            if (providerDetails.getZipCode() != null) provider.setZipCode(providerDetails.getZipCode());
            if (providerDetails.getStatus() != null) provider.setStatus(providerDetails.getStatus());
            return providerRepository.save(provider);
        }).orElseThrow(() -> new RuntimeException("Provider not found"));
    }

    public void deleteProvider(Long id) {
        providerRepository.deleteById(id);
    }

    public List<Provider> getProvidersByCategory(String category) {
        return providerRepository.findByCategory(category);
    }

    public Provider addMediaToGallery(Long id, String imageUrl) {
        return providerRepository.findById(id).map(provider -> {
            provider.getImageUrls().add(imageUrl);
            return providerRepository.save(provider);
        }).orElseThrow(() -> new RuntimeException("Provider not found"));
    }

    public String getProviderAnalytics(Long id) {
        Provider provider = providerRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Provider not found"));
        return "Profile Views: " + provider.getProfileViews() + 
               ", Package Clicks: " + provider.getPackageClicks();
    }
}