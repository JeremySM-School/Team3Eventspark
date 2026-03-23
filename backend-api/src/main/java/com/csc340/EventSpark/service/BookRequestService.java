package com.csc340.EventSpark.service;

import com.csc340.EventSpark.entity.BookRequest;
import com.csc340.EventSpark.entity.BookRequest.BookingStatus;
import com.csc340.EventSpark.repository.BookRequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BookRequestService {

    @Autowired
    private BookRequestRepository bookRequestRepository;

    public BookRequest createBookRequest(BookRequest request) {
        return bookRequestRepository.save(request);
    }

    public Optional<BookRequest> getBookRequestById(Long id) {
        return bookRequestRepository.findById(id);
    }

    public List<BookRequest> getAllBookRequests() {
        return bookRequestRepository.findAll();
    }

    public List<BookRequest> getBookRequestsByProviderId(Long providerId) {
        return bookRequestRepository.findByProviderId(providerId);
    }

    public List<BookRequest> getBookRequestsByEventId(Long eventId) {
        return bookRequestRepository.findByEventId(eventId);
    }

    public List<BookRequest> getBookRequestsByCustomerId(Long customerId) {
        return bookRequestRepository.findByCustomerId(customerId);
    }

    public List<BookRequest> getBookRequestsByPackageId(Long packageId) {
        return bookRequestRepository.findByPackageId(packageId);
    }

    public BookRequest updateBookRequest(Long id, BookRequest requestDetails) {
        return bookRequestRepository.findById(id).map(request -> {
            request.setStatus(requestDetails.getStatus());
            if (requestDetails.getTotalPrice() != null) {
                request.setTotalPrice(requestDetails.getTotalPrice());
            }
            return bookRequestRepository.save(request);
        }).orElseThrow(() -> new RuntimeException("Booking Request not found"));
    }

    public List<BookRequest> getBookRequestsByStatus(BookingStatus status) {
        return bookRequestRepository.findByStatus(status);
    }

    public void deleteBookRequest(Long id) {
        bookRequestRepository.deleteById(id);
    }
}