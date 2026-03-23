package com.csc340.EventSpark.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.List;

import org.springframework.cglib.core.Local;

import java.time.LocalDateTime;

@Entity
@Table(name = "conversations")
@Data
@NoArgsConstructor
@AllArgsConstructor

public class Conversation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDateTime lastMessageAt;
    private Boolean isActive = true;

    @ManyToOne
    @JoinColumn(name = "customer_id", nullable = false)
    @JsonIgnoreProperties("conversations")
    private Customer customer;

    @ManyToOne
    @JoinColumn(name = "provider_id", nullable = false)
    @JsonIgnoreProperties("conversations")
    private Provider provider;

    @ManyToOne
    @JoinColumn(name = "book_request_id", nullable = false)
    @JsonIgnoreProperties("conversations")
    private BookRequest bookRequest;

    @OneToMany(mappedBy = "thread", cascade = CascadeType.ALL)
    @JsonIgnoreProperties("thread")
    private List<Message> messages;
}
