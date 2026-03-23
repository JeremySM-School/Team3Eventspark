package com.csc340.EventSpark.service;

import com.csc340.EventSpark.entity.BookRequest;
import com.csc340.EventSpark.entity.BookRequest.BookRequestStatus;
import com.csc340.EventSpark.repository.BookRequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BookRequestService {
    
    @Autowired
    private BookRequestRepository bookrequestRepository;

    public BookRequest createBookRequest(BookRequest bookRequest){
        return bookrequestRepository.save(bookRequest);
    }

    public Optional<BookRequest> getBookRequestById(Long id){
        return bookrequestRepository.findById(id);
    }

    public List<BookRequest> getAllBookRequests(){
        return bookrequestRepository.findAll();
    }

    public List<BookRequest> getBookRequestByCustomerId(Long customerId){
        return bookrequestRepository.findByCustomerId(customerId);
    }

     public List<BookRequest> getBookRequestByProviderId(Long providerId){
        return bookrequestRepository.findByProviderId(providerId);
    }

    public List<BookRequest> getBookRequestsByPackageId(Long packageId){
        return bookrequestRepository.findByPackageId(packageId);
    }

    public List<BookRequest> getBookRequestsByStatus(BookRequestStatus status){
        return bookrequestRepository.findByStatus(status);
    }

    public BookRequest updateBookRequest(Long id, BookRequest bookRequestDetails){
        return bookrequestRepository.findById(id).map(bookRequest -> {
            bookRequest.setStatus(bookRequestDetails.getStatus());
            bookRequest.setEventDate(bookRequestDetails.getEventDate());
            bookRequest.setTotalPrice(bookRequestDetails.getTotalPrice());
            bookRequest.setLocation(bookRequestDetails.getLocation());
            return bookrequestRepository.save(bookRequest);
        }).orElseThrow(() -> new RuntimeException("BookRequest not found"));
    }

    public void deleteBookRequest(Long id){
        bookrequestRepository.deleteById(id);
    }
}