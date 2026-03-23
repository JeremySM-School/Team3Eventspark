package com.csc340.EventSpark.controller;

import com.csc340.EventSpark.entity.Provider;
import com.csc340.EventSpark.service.ProviderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/providers")
public class ProviderController {

    @Autowired
    private ProviderService providerService;

    @PostMapping
    public ResponseEntity<Provider> createProvider(@RequestBody Provider provider) {
        Provider createdProvider = providerService.createProvider(provider);
        return new ResponseEntity<>(createdProvider, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<Provider>> getAllProviders() {
        List<Provider> providers = providerService.getAllProviders();
        return new ResponseEntity<>(providers, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Provider> getProviderById(@PathVariable Long id) {
        Optional<Provider> provider = providerService.getProviderById(id);
        return provider.map(p -> new ResponseEntity<>(p, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @GetMapping("/email/{email}")
    public ResponseEntity<Provider> getProviderByEmail(@PathVariable String email) {
        Provider provider = providerService.getProviderByEmail(email);
        return provider != null ? new ResponseEntity<>(provider, HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Provider> updateProvider(@PathVariable Long id, @RequestBody Provider providerDetails) {
        try {
            Provider updatedProvider = providerService.updateProvider(id, providerDetails);
            return new ResponseEntity<>(updatedProvider, HttpStatus.OK);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteProvider(@PathVariable Long id) {
        providerService.deleteProvider(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @GetMapping("/category/{category}")
    public ResponseEntity<List<Provider>> getProvidersByCategory(@PathVariable String category) {
        List<Provider> providers = providerService.getProvidersByCategory(category);
        return new ResponseEntity<>(providers, HttpStatus.OK);
    }

    @PostMapping("/{id}/gallery")
    public ResponseEntity<Provider> addMediaToGallery(@PathVariable Long id, @RequestBody String imageUrl) {
        try {
            Provider updatedProvider = providerService.addMediaToGallery(id, imageUrl);
            return new ResponseEntity<>(updatedProvider, HttpStatus.OK);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/{id}/analytics")
    public ResponseEntity<String> getProviderAnalytics(@PathVariable Long id) {
        try {
            String analytics = providerService.getProviderAnalytics(id);
            return new ResponseEntity<>(analytics, HttpStatus.OK);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}