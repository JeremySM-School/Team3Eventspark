package com.csc340.EventSpark.service;

import com.csc340.EventSpark.entity.EventPackage;
import com.csc340.EventSpark.entity.EventPackage.PackageStatus;
import com.csc340.EventSpark.repository.EventPackageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EventPackageService {

    @Autowired
    private EventPackageRepository packageRepository;

    public EventPackage createPackage(EventPackage eventPackage) {
        return packageRepository.save(eventPackage);
    }

    public Optional<EventPackage> getPackageById(Long id) {
        return packageRepository.findById(id);
    }

    public List<EventPackage> getAllPackages() {
        return packageRepository.findAll();
    }

    public List<EventPackage> getPackagesByProviderId(Long providerId) {
        return packageRepository.findByProviderId(providerId);
    }

    public List<EventPackage> getPackagesByStatus(PackageStatus status) {
        return packageRepository.findByStatus(status);
    }

    public EventPackage updatePackage(Long id, EventPackage packageDetails) {
        return packageRepository.findById(id).map(pkg -> {
            pkg.setTitle(packageDetails.getTitle());
            pkg.setDescription(packageDetails.getDescription());
            pkg.setPrice(packageDetails.getPrice());
            pkg.setStatus(packageDetails.getStatus());
            return packageRepository.save(pkg);
        }).orElseThrow(() -> new RuntimeException("Package not found"));
    }

    public void deletePackage(Long id) {
        packageRepository.deleteById(id);
    }
}