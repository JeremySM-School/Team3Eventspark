package com.csc340.EventSpark.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.csc340.EventSpark.entity.Provider;
import com.csc340.EventSpark.entity.ServicePackage;
import com.csc340.EventSpark.repository.ServicePackageRepository;
import com.csc340.EventSpark.repository.ProviderRepository;
import java.util.*;


@Controller
@RequestMapping("/provider")
public class ProviderUIController {

    @Autowired
    private ServicePackageRepository packageRepo;

    @Autowired
    private ProviderRepository providerRepo;

    @GetMapping("/dashboard")
    public String getDashboard(Model model) {
        return "p_dashboard";
    }

    @GetMapping("/packages")
    public String getPackages(Model model) {
        // Fetch all packages from the database
        // We use model.addAttribute to pass this list to the HTML page
        model.addAttribute("packageList", packageRepo.findAll());
        return "packages";
    }

    @GetMapping("/calendar")
    public String getCalendar(Model model) {
        return "calendar";
    }

    @PostMapping("/packages/new")
    public String createNewPackage(
            @RequestParam String title,
            @RequestParam String description,
            @RequestParam Double price) {
        
        ServicePackage newPackage = new ServicePackage();
        newPackage.setTitle(title);
        newPackage.setDescription(description);
        newPackage.setPrice(price);
        
        // FIXED: Set default values for category and status
        newPackage.setStatus(ServicePackage.PackageStatus.ACTIVE); 
        newPackage.setCategory(ServicePackage.PackageCategory.OTHER); 
        
        // Hardcoding the Provider ID to 2 
        Provider p = new Provider(); 
        p.setId(2L); 
        newPackage.setProvider(p);

        // Save to Neon Database
        packageRepo.save(newPackage);
        
        // Reload the page
        return "redirect:/provider/packages";
    }

    // Loads the Edit Profile page with your current data
    @GetMapping("/profile/edit")
    public String getEditProfile(Model model) {
        // Hardcoding ID 2 just like we did for packages
        Provider p = providerRepo.findById(2L).orElse(new Provider());
        model.addAttribute("provider", p);
        return "edit_p_profile";
    }

    // Catches the form submission and saves the new bio/name
    @PostMapping("/profile/edit")
    public String updateProfile(
            @RequestParam String name,
            @RequestParam String bio,
            @RequestParam(required = false) List<String> category) {
        
        // Grab the existing provider
        Provider p = providerRepo.findById(2L).orElse(new Provider());
        
        // Update the fields (assuming your Provider entity has 'name' and 'bio')
        p.setName(name); 
        p.setBio(bio);

        if (category != null) {
            p.setCategory(String.join(", ", category)); // Join the list into a comma-separated string
        } else {
            p.setCategory(""); // Set to empty string if no categories selected
        }
        
        // Save it back to Neon
        providerRepo.save(p);
        
        // Send you back to the dashboard when done
        return "redirect:/provider/dashboard";
    }
}