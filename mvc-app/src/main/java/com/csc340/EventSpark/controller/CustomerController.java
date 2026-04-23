package com.csc340.EventSpark.controller;

import com.csc340.EventSpark.entity.Customer;
import com.csc340.EventSpark.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/customers")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @PostMapping("/create")
    public String createCustomer(Customer customer) {
        Customer created = customerService.createCustomer(customer);
        return "redirect:/customers/dashboard/" + created.getId();
    }


@GetMapping("/dashboard/{id}")
    public String showDashboard(@PathVariable Long id, Model model) {
        Customer customer = customerService.getCustomerById(id).orElse(null);
        if (customer != null) {
            model.addAttribute("customer", customer);
            return "Customer/c_dashboard"; 
        }
        return "redirect:/login"; 
    }


    @GetMapping("/{id}")
    public String getCustomerById(@PathVariable Long id, Model model) {
        Customer customer = customerService.getCustomerById(id).orElse(null);
        model.addAttribute("customer", customer);
        return "Customer/c_dashboard";
    }

    @GetMapping("/email/{email}")
public String getCustomerByEmail(@PathVariable String email, Model model) {
    Customer customer = customerService.getCustomerByEmail(email);
    if (customer != null) {
        model.addAttribute("customer", customer);
        return "Customer/c_dashboard"; 
    }
    return "redirect:/customers/not-found"; // Redirect to a not-found page or handle as needed
}

   @PostMapping("/update/{id}")
    public String updateCustomer(@PathVariable Long id, Customer customerDetails) {
        customerService.updateCustomer(id, customerDetails);
        return "redirect:/customers/dashboard/" + id;
    }
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Customer customer = customerService.getCustomerById(id).orElse(null);
        model.addAttribute("customer", customer);
        return "Customer/edit_c_profile";
    }

   @GetMapping("/delete/{id}")
    public String deleteCustomer(@PathVariable Long id) {
        customerService.deleteCustomer(id);
        return "redirect:/login";
    }

}
