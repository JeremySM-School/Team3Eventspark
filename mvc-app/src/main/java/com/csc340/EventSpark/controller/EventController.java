package com.csc340.EventSpark.controller;

import com.csc340.EventSpark.entity.Event;
import com.csc340.EventSpark.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/events")
public class EventController {
    
    @Autowired
    private EventService eventService;

    @GetMapping("/new/{customerId}")
    public String showCreateForm(@PathVariable Long customerId, Model model) {
        model.addAttribute("customerId", customerId);
        return "Customer/create_event"; 
    }

    @PostMapping("/create")
    public String createEvent(Event event) {
        Event created = eventService.createEvent(event);
        return "redirect:/events/customer/" + created.getCustomerId();
    }

    @GetMapping("/customer/{customerId}")
    public String getEventsByCustomer(@PathVariable Long customerId, Model model) {
        model.addAttribute("events", eventService.getEventsByCustomerId(customerId));
        model.addAttribute("customerId", customerId);
        return "Customer/e_list"; 
    }

    @PostMapping("/update/{id}")
    public String updateEvent(@PathVariable Long id, Event eventDetails) {
        Event updated = eventService.updateEvent(id, eventDetails);
        return "redirect:/events/customer/" + updated.getCustomerId();
    }

    @GetMapping("/delete/{id}/{customerId}")
    public String deleteEvent(@PathVariable Long id, @PathVariable Long customerId) {
        eventService.deleteEvent(id);
        return "redirect:/events/customer/" + customerId;
    }
}