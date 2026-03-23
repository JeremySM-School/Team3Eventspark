package com.csc340.EventSpark.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "messages")
@Data
@NoArgsConstructor
@AllArgsConstructor

public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(columnDefinition = "TEXT", nullable = false)
    private String content;

    private LocalDateTime timestamp;
    private Boolean isRead = false;

    @ManyToOne
    @JoinColumn(name = "thread_id", nullable = false)
    @JsonIgnoreProperties("messages")
    private Conversation thread;

    @ManyToOne
    @JoinColumn(name = "sender_id", nullable = false)
    @JsonIgnoreProperties("sentMessages")
    private User sender;

    @PrePersist
    protected void onCreate() {
        this.timestamp = LocalDateTime.now();
    }
    
}
