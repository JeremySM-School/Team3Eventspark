package com.csc340.EventSpark.service;

import com.csc340.EventSpark.entity.Message;
import com.csc340.EventSpark.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MessageService {

    @Autowired
    private MessageRepository messageRepository;

    public Message createMessage(Message message) {
        return messageRepository.save(message);
    }

    public Optional<Message> getMessageById(Long id) {
        return messageRepository.findById(id);
    }

    public List<Message> getAllMessages() {
        return messageRepository.findAll();
    }

    public List<Message> getMessagesByThreadId(Long threadId) {
        return messageRepository.findByThreadId(threadId);
    }

    public Message updateMessage(Long id, Message messageDetails) {
        return messageRepository.findById(id).map(message -> {
            if (messageDetails.getContent() != null) {
                message.setContent(messageDetails.getContent());
            }
            if (messageDetails.getIsRead() != null) {
                message.setIsRead(messageDetails.getIsRead());
            }
            return messageRepository.save(message);
        }).orElseThrow(() -> new RuntimeException("Message not found"));
    }

    public void deleteMessage(Long id) {
        messageRepository.deleteById(id);
    }
}