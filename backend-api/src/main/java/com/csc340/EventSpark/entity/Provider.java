package com.csc340.EventSpark.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.EqualsAndHashCode;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.List;

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

    private Integer profileViews = 0; // track profile views
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

}
