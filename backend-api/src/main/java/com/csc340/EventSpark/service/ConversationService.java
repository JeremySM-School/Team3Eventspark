package com.csc340.EventSpark.service;

import com.csc340.EventSpark.entity.Conversation;
import com.csc340.EventSpark.repository.ConversationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ConversationService {

    @Autowired
    private ConversationRepository conversationRepository;

    public Conversation createConversation(Conversation conversation) {
        return conversationRepository.save(conversation);
    }

    public Optional<Conversation> getConversationById(Long id) {
        return conversationRepository.findById(id);
    }

    public List<Conversation> getAllConversations() {
        return conversationRepository.findAll();
    }

    public List<Conversation> getConversationsByProviderId(Long providerId) {
        return conversationRepository.findByProviderId(providerId);
    }

    public List<Conversation> getConversationsByCustomerId(Long customerId) {
        return conversationRepository.findByCustomerId(customerId);
    }

    public Conversation updateConversation(Long id, Conversation conversationDetails) {
        return conversationRepository.findById(id).map(conversation -> {
            if (conversationDetails.getLastMessageAt() != null) {
                conversation.setLastMessageAt(conversationDetails.getLastMessageAt());
            }
            if (conversationDetails.getIsActive() != null) {
                conversation.setIsActive(conversationDetails.getIsActive());
            }
            return conversationRepository.save(conversation);
        }).orElseThrow(() -> new RuntimeException("Conversation not found"));
    }

    public void deleteConversation(Long id) {
        conversationRepository.deleteById(id);
    }
}