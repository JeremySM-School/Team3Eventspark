package com.csc340.EventSpark.entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.CascadeType;
import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrimaryKeyJoinColumn;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "providers")
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@PrimaryKeyJoinColumn(name = "user_id")

public class Provider extends User{

    private String name;
    private String category;

    @Column(columnDefinition = "TEXT")
    private String bio;

    private Integer serviceRadius; // in miles
    private String zipCode;
    private Double rating; // average rating from reviews


    private Integer packageClicks = 0; // track clicks on event packages

    //image urls
    @ElementCollection
    @CollectionTable(name = "provider_images", joinColumns = @JoinColumn(name = "provider_id"))
    @Column(name = "image_url")
    private List<String> imageUrls;

    //booking calendar
    @ElementCollection
    @CollectionTable(name = "provider_blocked_dates", joinColumns = @JoinColumn(name = "provider_id"))
    @Column(name = "blocked_date")
    private List<String> blockedDates; // store blocked dates as strings for simplicity

    @OneToMany(mappedBy = "provider", cascade = CascadeType.ALL)
    @JsonIgnoreProperties("provider")
    private List<ServicePackage> packages;

    private long profileViews = 0;

    // Add Getter and Setter
    public long getProfileViews() { return profileViews; }
    public void setProfileViews(long profileViews) { this.profileViews = profileViews; }

}
