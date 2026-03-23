package com.csc340.EventSpark.service;

import com.csc340.EventSpark.entity.Event;
import com.csc340.EventSpark.repository.EventRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class EventService {
    @Autowired
    private EventRepository eventRepository;

    public Event createEvent(Event event) {
        return eventRepository.save(event);
    }

    public List<Event> getEventsByCustomerId(Long customerId) {
        return eventRepository.findByCustomerId(customerId);
    }

    public Optional<Event> getEventById(Long id) {
        return eventRepository.findById(id);
    }

    public Event updateEvent(Long id, Event eventDetails) {
        return eventRepository.findById(id).map(event -> {
            if (eventDetails.getEventName() != null) event.setEventName(eventDetails.getEventName());
            if (eventDetails.getEventDate() != null) event.setEventDate(eventDetails.getEventDate());
            if (eventDetails.getLocation() != null) event.setLocation(eventDetails.getLocation());
            return eventRepository.save(event);
        }).orElseThrow(() -> new RuntimeException("Event not found"));
    }

    public void deleteEvent(Long id) {
        eventRepository.deleteById(id);
    }
}