package com.example.EventSpark.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.List;

@Entity
@Table(name = "book_requests")
@Data
@NoArgsConstructor
@AllArgsConstructor

public class BookRequest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String status; // e.g., "PENDING", "APPROVED", "REJECTED"
    private Double totalPrice;

    @ManyToOne
    @JoinColumn(name = "event_id", nullable = false)
    @JsonIgnoreProperties("bookRequests")
    private Event event;

    @ManyToOne
    @JoinColumn(name = "provider_id", nullable = false)
    [private ServiceProvider provider;]
    
    @ManyToMany
    @JoinTable(
        name = "book_request_packages",
        joinColumns = @JoinColumn(name = "book_request_id"),
        inverseJoinColumns = @JoinColumn(name = "event_package_id")
    )
    private List<EventPackage> eventPackages;
}
