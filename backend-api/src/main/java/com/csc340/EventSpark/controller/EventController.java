package com.csc340.EventSpark.controller;

import com.csc340.EventSpark.entity.Event;
import com.csc340.EventSpark.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/events")
public class EventController {
    @Autowired
    private EventService eventService;

    @PostMapping
    public ResponseEntity<Event> createEvent(@RequestBody Event event) {
        return new ResponseEntity<>(eventService.createEvent(event), HttpStatus.CREATED);
    }

    @GetMapping("/customer/{customerId}")
    public ResponseEntity<List<Event>> getEventsByCustomer(@PathVariable Long customerId) {
        return new ResponseEntity<>(eventService.getEventsByCustomerId(customerId), HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Event> updateEvent(@PathVariable Long id, @RequestBody Event eventDetails) {
        return new ResponseEntity<>(eventService.updateEvent(id, eventDetails), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteEvent(@PathVariable Long id) {
        eventService.deleteEvent(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}