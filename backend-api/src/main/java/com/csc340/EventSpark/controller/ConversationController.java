package com.csc340.EventSpark.controller;

import com.csc340.EventSpark.entity.Conversation;
import com.csc340.EventSpark.service.ConversationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/conversations")
public class ConversationController {

    @Autowired
    private ConversationService conversationService;

    // Creates a new chat thread between a customer and provider
    @PostMapping
    public ResponseEntity<Conversation> createConversation(@RequestBody Conversation conversation) {
        Conversation createdConversation = conversationService.createConversation(conversation);
        return new ResponseEntity<>(createdConversation, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<Conversation>> getAllConversations() {
        List<Conversation> conversations = conversationService.getAllConversations();
        return new ResponseEntity<>(conversations, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Conversation> getConversationById(@PathVariable Long id) {
        Optional<Conversation> conversation = conversationService.getConversationById(id);
        return conversation.map(c -> new ResponseEntity<>(c, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    // US-HOST-008: Loads the Provider's inbox list
    @GetMapping("/provider/{providerId}")
    public ResponseEntity<List<Conversation>> getConversationsByProviderId(@PathVariable Long providerId) {
        List<Conversation> conversations = conversationService.getConversationsByProviderId(providerId);
        return new ResponseEntity<>(conversations, HttpStatus.OK);
    }

    // Loads the Customer's inbox list
    @GetMapping("/customer/{customerId}")
    public ResponseEntity<List<Conversation>> getConversationsByCustomerId(@PathVariable Long customerId) {
        List<Conversation> conversations = conversationService.getConversationsByCustomerId(customerId);
        return new ResponseEntity<>(conversations, HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Conversation> updateConversation(@PathVariable Long id, @RequestBody Conversation conversationDetails) {
        try {
            Conversation updatedConversation = conversationService.updateConversation(id, conversationDetails);
            return new ResponseEntity<>(updatedConversation, HttpStatus.OK);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteConversation(@PathVariable Long id) {
        conversationService.deleteConversation(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}