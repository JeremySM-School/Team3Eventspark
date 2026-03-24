package com.csc340.EventSpark.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.List;
import java.time.LocalDateTime;

@Entity
@Table(name = "book_requests")
@Data
@NoArgsConstructor
@AllArgsConstructor

public class BookRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private BookingStatus status; // e.g., "PENDING", "APPROVED", "REJECTED"

    private Double totalPrice;

    @Column(nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @Column(nullable = false)
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    @ManyToOne
    @JoinColumn(name = "event_id", nullable = false)
    @JsonIgnoreProperties("bookRequests")
    private Event event;

    @ManyToOne
    @JoinColumn(name = "provider_id", nullable = false)
    @JsonIgnoreProperties("bookRequests")
    private Provider provider;

    @ManyToMany
    @JoinTable(
        name = "book_request_packages",
        joinColumns = @JoinColumn(name = "book_request_id"),
        inverseJoinColumns = @JoinColumn(name = "service_package_id")
    )
    private List<ServicePackage> servicePackages;

    public enum BookingStatus {
        PENDING,
        APPROVED,
        REJECTED,
        CANCELLED,
        COMPLETED
    }

}
