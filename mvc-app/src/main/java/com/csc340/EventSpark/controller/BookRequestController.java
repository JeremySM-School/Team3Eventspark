package com.csc340.EventSpark.controller;

import com.csc340.EventSpark.entity.BookRequest;
import com.csc340.EventSpark.service.BookRequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/bookings")
public class BookRequestController {

    @Autowired
    private BookRequestService bookRequestService;

    @GetMapping("/customer/{customerId}")
    public String getCustomerBookings(@PathVariable Long customerId, Model model) {
        List<BookRequest> bookings = bookRequestService.getBookRequestsByCustomerId(customerId);
        model.addAttribute("bookings", bookings);
        model.addAttribute("customerId", customerId);
        return "Customer/c_bookings"; 
    }

    @GetMapping("/new/{customerId}")
    public String showBookingForm(@PathVariable Long customerId, Model model) {
        model.addAttribute("customerId", customerId);
        return "Customer/booking_form";
    }

    @PostMapping("/create")
    public String createBooking(BookRequest bookRequest) {
        bookRequestService.createBookRequest(bookRequest);
        return "redirect:/bookings/customer/" + bookRequest.getCustomerId();
    }

    @GetMapping("/cancel/{id}/{customerId}")
    public String cancelBooking(@PathVariable Long id, @PathVariable Long customerId) {
        bookRequestService.deleteBookRequest(id);
        return "redirect:/bookings/customer/" + customerId;
    }
}