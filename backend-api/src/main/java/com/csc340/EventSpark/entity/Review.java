package com.example.EventSpark.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.time.LocalDateTime;

@Entity
@Table(name = "reviews")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer starRating;

    @Column(columnDefinition = "TEXT")
    private String comment;

    @Column(columnDefinition = "TEXT")
    private String replyText;

    private LocalDateTime reviewDate;
    @ManyToOne
    @JoinColumn(name = "customer_id", nullable = false)
    @JsonIgnoreProperties("reviews")
    private Customer customer;

    @OneToOne
    @JoinColumn(name = "book_request_id", nullable = false)
    @JsonIgnoreProperties("review")
    private BookRequest bookRequest;

    @PrePersist
    protected void onCreate() {
        this.reviewDate = LocalDateTime.now();
}