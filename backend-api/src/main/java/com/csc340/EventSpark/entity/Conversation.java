package com.csc340.EventSpark.entity;

import java.time.LocalDateTime;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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
