package com.csc340.EventSpark.service;

import com.csc340.EventSpark.entity.ServicePackage;
import com.csc340.EventSpark.entity.ServicePackage.PackageStatus;
import com.csc340.EventSpark.repository.ServicePackageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ServicePackageService {

    @Autowired
    private ServicePackageRepository packageRepository;

    public ServicePackage createPackage(ServicePackage servicePackage) {
        return packageRepository.save(servicePackage);
    }

    public Optional<ServicePackage> getPackageById(Long id) {
        return packageRepository.findById(id);
    }

    public List<ServicePackage> getAllPackages() {
        return packageRepository.findAll();
    }

    public List<ServicePackage> getPackagesByProviderId(Long providerId) {
        return packageRepository.findByProviderId(providerId);
    }

    public List<ServicePackage> getPackagesByStatus(PackageStatus status) {
        return packageRepository.findByStatus(status);
    }

    public ServicePackage updatePackage(Long id, ServicePackage packageDetails) {
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