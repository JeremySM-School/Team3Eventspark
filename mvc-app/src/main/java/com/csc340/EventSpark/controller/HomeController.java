package com.csc340.EventSpark.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.csc340.EventSpark.entity.Customer;
import com.csc340.EventSpark.entity.Provider;
import com.csc340.EventSpark.entity.User.UserRole;
import com.csc340.EventSpark.entity.User.UserStatus;
import com.csc340.EventSpark.repository.CustomerRepository;
import com.csc340.EventSpark.repository.ProviderRepository;
import com.csc340.EventSpark.repository.ServicePackageRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

    @Autowired
    private ProviderRepository providerRepo;

    @Autowired
    private CustomerRepository customerRepo;

    @Autowired
    private ServicePackageRepository packageRepo;

    @GetMapping("/")
    public String getHome(HttpSession session, Model model) { 
        model.addAttribute("userId", session.getAttribute("userId"));
        model.addAttribute("userRole", session.getAttribute("userRole"));
        return "home"; 
    }

    @GetMapping("/login")
    public String getLogin() { return "login"; }

    @GetMapping("/signup")
    public String getSignup() { return "signup"; }

    // --- FULLY FUNCTIONING SIGNUP ---
    @PostMapping("/signup")
    public String processSignup(
            @RequestParam String fullName,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String role) { 
        
        if ("PROVIDER".equals(role)) {
            Provider newProvider = new Provider();
            newProvider.setEmail(email);
            newProvider.setPasswordHash(password); // Using your exact field name
            newProvider.setRole(UserRole.PROVIDER);
            newProvider.setStatus(UserStatus.ACTIVE);
            newProvider.setName(fullName); // Provider uses 'name'
            providerRepo.save(newProvider);
        } else {
            Customer newCustomer = new Customer();
            newCustomer.setEmail(email);
            newCustomer.setPasswordHash(password);
            newCustomer.setRole(UserRole.CUSTOMER);
            newCustomer.setStatus(UserStatus.ACTIVE);
            
            // Split the full name for the Customer entity (firstName, lastName)
            String[] names = fullName.split(" ", 2);
            newCustomer.setFirstName(names[0]);
            if (names.length > 1) {
                newCustomer.setLastName(names[1]);
            }
            customerRepo.save(newCustomer);
        }

        return "redirect:/login";
    }

    // --- FULLY FUNCTIONING LOGIN ---
    @PostMapping("/login")
    public String processLogin(
            @RequestParam String email, 
            @RequestParam String password,
            HttpSession session) {
        
        // 1. Check Provider Database
        Provider provider = providerRepo.findByEmail(email);
        if (provider != null && provider.getPasswordHash().equals(password)) {
            session.setAttribute("userId", provider.getId());
            session.setAttribute("userRole", provider.getRole().name());
            return "redirect:/provider/dashboard";
        }

        // 2. Check Customer Database
        Customer customer = customerRepo.findByEmail(email);
        if (customer != null && customer.getPasswordHash().equals(password)) {
            session.setAttribute("userId", customer.getId());
            session.setAttribute("userRole", customer.getRole().name());
            return "redirect:/customer/dashboard";
        }
        
        // 3. Fail -> Back to login
        return "redirect:/login?error=true"; 
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); 
        return "redirect:/";
    }

    // --- BROWSE SERVICES  ---
    @GetMapping("/browse")
    public String browseServices(HttpSession session, Model model) {
        model.addAttribute("userId", session.getAttribute("userId"));
        model.addAttribute("userRole", session.getAttribute("userRole"));
        model.addAttribute("packages", packageRepo.findAll());
        return "browse_services";
    }
}