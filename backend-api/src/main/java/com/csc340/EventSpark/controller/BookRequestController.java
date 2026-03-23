package com.csc340.EventSpark.controller;

import com.csc340.EventSpark.entity.BookRequest;
import com.csc340.EventSpark.service.BookRequestService;
import com.csc340.EventSpark.service.EventPackageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.HttpStatus;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/book-requests")
public class BookRequestController {

    @Autowired
    private BookRequestService bookRequestService;

    @PostMapping
    public ResponseEntity<BookRequest> createBookRequest(@RequestBody BookRequest bookRequest) {
        BookRequest createdBookRequest = bookRequestService.createBookRequest(bookRequest);
        return new ResponseEntity<>(createdBookRequest, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<BookRequest>> getAllBookRequests() {
        List<BookRequest> bookRequests = bookRequestService.getAllBookRequests();
        return ResponseEntity.ok(bookRequests);
    }

    @GetMapping("/{id}")
    public ResponseEntity<BookRequest> getBookRequestById(@PathVariable Long id) {
        Optional<BookRequest> bookRequest = bookRequestService.getBookRequestById(id);
        return bookRequest.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
        
    }

    @GetMapping("/customer/{customerId}")
    public ResponseEntity<List<BookRequest>> getBookRequestsByCustomerId(@PathVariable Long customerId) {
        List<BookRequest> bookRequests = bookRequestService.getBookRequestsByCustomerId(customerId);
        return ResponseEntity.ok(bookRequests);
    }

    @GetMapping("/event-package/{eventPackageId}")
    public ResponseEntity<List<BookRequest>> getBookRequestsByEventPackageId(@PathVariable Long eventPackageId) {
        List<BookRequest> bookRequests = bookRequestService.getBookRequestsByEventPackageId(eventPackageId);
        return ResponseEntity.ok(bookRequests);
    }

    @GetMapping("/provider/{providerId}")
    public ResponseEntity<List<BookRequest>> getBookRequestsByProviderId(@PathVariable Long providerId) {
        List<BookRequest> bookRequests = bookRequestService.getBookRequestsByProviderId(providerId);
        return ResponseEntity.ok(bookRequests);
    }

    @GetMapping("/status/{status}")
    public ResponseEntity<List<BookRequest>> getBookRequestsByStatus(@PathVariable String status) {
        List<BookRequest> bookRequests = bookRequestService.getBookRequestsByStatus(status);
        return ResponseEntity.ok(bookRequests);
    }

    @PutMapping("/{id}")
    public ResponseEntity<BookRequest> updateBookRequest(@PathVariable Long id, @RequestBody BookRequest bookRequest) {
        Optional<BookRequest> updatedBookRequest = bookRequestService.updateBookRequest(id, bookRequest);
        return updatedBookRequest.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteBookRequest(@PathVariable Long id) {
        boolean deleted = bookRequestService.deleteBookRequest(id);
        if (deleted) {
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}