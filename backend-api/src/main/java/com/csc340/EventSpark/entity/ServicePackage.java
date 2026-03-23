package com.csc340.EventSpark.entity;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "event_packages")
@Data
@NoArgsConstructor
@AllArgsConstructor

public class ServicePackage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    @Column(columnDefinition = "TEXT")
    private String description;

    private Double price;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private PackageCategory category;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private PackageStatus status;

    @Column(nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @Column(nullable = false, updatable = false)
    private LocalDateTime updatedAt;

    @ManyToOne
    @JoinColumn(name = "provider_id", nullable = false)
    @JsonIgnoreProperties("eventPackages")
    private Provider provider;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    public enum PackageCategory {
        MUSIC,
        ARTIST,
        DECORATOR,
        BAKER,
        OTHER
    }

    public enum PackageStatus {
        ACTIVE,
        INACTIVE
    }
}
