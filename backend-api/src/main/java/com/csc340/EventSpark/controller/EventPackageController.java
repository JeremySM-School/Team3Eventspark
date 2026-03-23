package com.csc340.EventSpark.controller;

import com.csc340.EventSpark.entity.EventPackage;
import com.csc340.EventSpark.entity.EventPackage.PackageStatus;
import com.csc340.EventSpark.service.EventPackageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/packages")
public class EventPackageController {

    @Autowired
    private EventPackageService packageService;

    @PostMapping
    public ResponseEntity<EventPackage> createPackage(@RequestBody EventPackage eventPackage) {
        EventPackage createdPackage = packageService.createPackage(eventPackage);
        return new ResponseEntity<>(createdPackage, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<EventPackage>> getAllPackages() {
        List<EventPackage> packages = packageService.getAllPackages();
        return new ResponseEntity<>(packages, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<EventPackage> getPackageById(@PathVariable Long id) {
        Optional<EventPackage> pkg = packageService.getPackageById(id);
        return pkg.map(p -> new ResponseEntity<>(p, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @GetMapping("/provider/{providerId}")
    public ResponseEntity<List<EventPackage>> getPackagesByProviderId(@PathVariable Long providerId) {
        List<EventPackage> packages = packageService.getPackagesByProviderId(providerId);
        return new ResponseEntity<>(packages, HttpStatus.OK);
    }

    @GetMapping("/status/{status}")
    public ResponseEntity<List<EventPackage>> getPackagesByStatus(@PathVariable PackageStatus status) {
        List<EventPackage> packages = packageService.getPackagesByStatus(status);
        return new ResponseEntity<>(packages, HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<EventPackage> updatePackage(@PathVariable Long id, @RequestBody EventPackage packageDetails) {
        try {
            EventPackage updatedPackage = packageService.updatePackage(id, packageDetails);
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