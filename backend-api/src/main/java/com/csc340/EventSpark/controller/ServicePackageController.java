package com.csc340.EventSpark.controller;

import com.csc340.EventSpark.entity.ServicePackage;
import com.csc340.EventSpark.entity.ServicePackage.PackageStatus;
import com.csc340.EventSpark.service.ServicePackageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/packages")
public class ServicePackageController {

    @Autowired
    private ServicePackageService packageService;

    @PostMapping
    public ResponseEntity<ServicePackage> createPackage(@RequestBody ServicePackage eventPackage) {
        ServicePackage createdPackage = packageService.createPackage(eventPackage);
        return new ResponseEntity<>(createdPackage, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<ServicePackage>> getAllPackages() {
        List<ServicePackage> packages = packageService.getAllPackages();
        return new ResponseEntity<>(packages, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<ServicePackage> getPackageById(@PathVariable Long id) {
        Optional<ServicePackage> pkg = packageService.getPackageById(id);
        return pkg.map(p -> new ResponseEntity<>(p, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @GetMapping("/provider/{providerId}")
    public ResponseEntity<List<ServicePackage>> getPackagesByProviderId(@PathVariable Long providerId) {
        List<ServicePackage> packages = packageService.getPackagesByProviderId(providerId);
        return new ResponseEntity<>(packages, HttpStatus.OK);
    }

    @GetMapping("/status/{status}")
    public ResponseEntity<List<ServicePackage>> getPackagesByStatus(@PathVariable PackageStatus status) {
        List<ServicePackage> packages = packageService.getPackagesByStatus(status);
        return new ResponseEntity<>(packages, HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<ServicePackage> updatePackage(@PathVariable Long id, @RequestBody ServicePackage packageDetails) {
        try {
            ServicePackage updatedPackage = packageService.updatePackage(id, packageDetails);
            return new ResponseEntity<>(updatedPackage, HttpStatus.OK);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletePackage(@PathVariable Long id) {
        packageService.deletePackage(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}