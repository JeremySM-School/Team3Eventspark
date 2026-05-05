package com.csc340.EventSpark.entity;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrimaryKeyJoinColumn;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "customers")
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@PrimaryKeyJoinColumn(name = "user_id")
public class Customer extends User {

    private String firstName;
    private String lastName;
    private String phone;

    private Boolean notificationsEnabled = true; // default to true

    //follow providers
    @ManyToMany
    @JoinTable(
        name = "customer_favorites",
        joinColumns = @JoinColumn(name = "customer_id"),
        inverseJoinColumns = @JoinColumn(name = "package_id")
    )
    private List<ServicePackage> favoritePackages = new ArrayList<>();

    // Standard Getters and Setters
    public List<ServicePackage> getFavoritePackages() { return favoritePackages; }
    public void setFavoritePackages(List<ServicePackage> favoritePackages) { this.favoritePackages = favoritePackages; }

    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL)
    @JsonIgnoreProperties("customer")
    private List<Event> events;

}