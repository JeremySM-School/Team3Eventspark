package com.csc340.EventSpark.controller;

import com.csc340.EventSpark.entity.BookRequest;
import com.csc340.EventSpark.service.BookRequestService;
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
        return new ResponseEntity<>(bookRequests, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<BookRequest> getBookRequestById(@PathVariable Long id) {
        Optional<BookRequest> bookRequest = bookRequestService.getBookRequestById(id);
        return bookRequest.map(r -> new ResponseEntity<>(r, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @GetMapping("/customer/{customerId}")
    public ResponseEntity<List<BookRequest>> getBookRequestsByCustomerId(@PathVariable Long customerId) {
        List<BookRequest> bookRequests = bookRequestService.getBookRequestsByCustomerId(customerId);
        return new ResponseEntity<>(bookRequests, HttpStatus.OK);
    }

    @GetMapping("/event-package/{eventPackageId}")
    public ResponseEntity<List<BookRequest>> getBookRequestsByEventPackageId(@PathVariable Long eventPackageId) {
        List<BookRequest> bookRequests = bookRequestService.getBookRequestsByPackageId(eventPackageId);
        return new ResponseEntity<>(bookRequests, HttpStatus.OK);
    }

    @GetMapping("/provider/{providerId}")
    public ResponseEntity<List<BookRequest>> getBookRequestsByProviderId(@PathVariable Long providerId) {
        List<BookRequest> bookRequests = bookRequestService.getBookRequestsByProviderId(providerId);
        return ResponseEntity.ok(bookRequests);
    }

    @GetMapping("/status/{status}")
    public ResponseEntity<List<BookRequest>> getBookRequestsByStatus(@PathVariable String status) {
        try {
            BookRequest.BookingStatus bookingStatus = BookRequest.BookingStatus.valueOf(status.toUpperCase());
            List<BookRequest> bookRequests = bookRequestService.getBookRequestsByStatus(bookingStatus);
            return new ResponseEntity<>(bookRequests, HttpStatus.OK);
        } catch (IllegalArgumentException e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<BookRequest> updateBookRequest(@PathVariable Long id, @RequestBody BookRequest bookRequest) {
        try {
            Optional<BookRequest> updatedBookRequest = Optional.ofNullable(bookRequestService.updateBookRequest(id, bookRequest));
            return new ResponseEntity<>(updatedBookRequest.get(), HttpStatus.OK);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteBookRequest(@PathVariable Long id) {
        bookRequestService.deleteBookRequest(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}