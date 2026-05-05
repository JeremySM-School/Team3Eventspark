package com.csc340.EventSpark.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.csc340.EventSpark.entity.BookRequest;
import com.csc340.EventSpark.entity.Conversation;
import com.csc340.EventSpark.entity.Customer;
import com.csc340.EventSpark.entity.Event;
import com.csc340.EventSpark.entity.Message;
import com.csc340.EventSpark.entity.Provider;
import com.csc340.EventSpark.entity.Review;
import com.csc340.EventSpark.entity.ServicePackage;
import com.csc340.EventSpark.repository.BookRequestRepository;
import com.csc340.EventSpark.repository.ConversationRepository;
import com.csc340.EventSpark.repository.CustomerRepository;
import com.csc340.EventSpark.repository.EventRepository;
import com.csc340.EventSpark.repository.MessageRepository;
import com.csc340.EventSpark.repository.ProviderRepository;
import com.csc340.EventSpark.repository.ReviewRepository;
import com.csc340.EventSpark.repository.ServicePackageRepository;
import com.csc340.EventSpark.service.EventService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/customer")
public class CustomerUIController {

    @Autowired
    private CustomerRepository customerRepo;
    
    @Autowired
    private MessageRepository messageRepo;

    @Autowired
    private ReviewRepository reviewRepo;


    @Autowired
    private EventService eventService;

    @Autowired
    private ServicePackageRepository packageRepo;
    
    @Autowired
    private EventRepository eventRepo;
    
    @Autowired
    private BookRequestRepository bookRequestRepo;

    @Autowired
    private ConversationRepository conversationRepo;

    @Autowired
    private ProviderRepository providerRepo; 



    // --- DASHBOARD ---
    @GetMapping("/dashboard")
    public String getDashboard(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null || !"CUSTOMER".equals(session.getAttribute("userRole"))) return "redirect:/login";

        Customer c = customerRepo.findById(userId).orElse(new Customer());
        model.addAttribute("customer", c);

        // 1. Upcoming Events 
        long upcomingEventsCount = c.getEvents() != null ? c.getEvents().size() : 0;
        model.addAttribute("upcomingEventsCount", upcomingEventsCount);

        List<BookRequest> customerRequests = bookRequestRepo.findByCustomerId(userId);

        // 2. Pending Requests 
        long pendingRequestsCount = customerRequests.stream()
            .filter(req -> req.getStatus() == BookRequest.BookingStatus.PENDING)
            .count();
        model.addAttribute("pendingRequestsCount", pendingRequestsCount);

        // 3. Total Budget Spent
        double totalSpent = customerRequests.stream()
            .filter(req -> req.getStatus() == BookRequest.BookingStatus.APPROVED)
            .mapToDouble(BookRequest::getTotalPrice)
            .sum();
        model.addAttribute("totalSpent", totalSpent);

        return "c_dashboard";
    }

    // --- MESSAGING / INBOX ---
    @GetMapping("/inbox")
    public String getInbox(@RequestParam(required = false) Long threadId, Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        // 1. Fetch all chat threads belonging to this customer
        List<Conversation> threads = conversationRepo.findByCustomerId(userId);
        model.addAttribute("threads", threads);

        // 2. Default to the first thread if none is selected
        if (threadId == null && !threads.isEmpty()) {
            threadId = threads.get(0).getId();
        }

        // 3. Load the messages for the active thread
        if (threadId != null) {
            model.addAttribute("messages", messageRepo.findByThreadId(threadId));
            model.addAttribute("currentThreadId", threadId);
        }

        // Pass the logged-in ID so FreeMarker knows which chat bubbles to turn blue
        model.addAttribute("currentUserId", userId);

        List<BookRequest> pendingRequests = bookRequestRepo.findByCustomerId(userId).stream()
            .filter(req -> req.getStatus() == BookRequest.BookingStatus.PENDING)
            .toList();
        model.addAttribute("pendingRequests", pendingRequests);
        
        return "c_inbox";
    }

    @PostMapping("/inbox/send")
    public String sendMessage(@RequestParam Long threadId, @RequestParam String content, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        // Fetch the actual objects from the database
        Customer sender = customerRepo.findById(userId).orElseThrow();
        Conversation thread = conversationRepo.findById(threadId).orElseThrow();

        Message newMessage = new Message();
        newMessage.setContent(content);
        newMessage.setSender(sender); // Set the object, not the ID!
        newMessage.setThread(thread); // Set the object, not the ID!
        messageRepo.save(newMessage);

        return "redirect:/customer/inbox?threadId=" + threadId;
    }

    // --- REVIEWS ---
    @GetMapping("/reviews")
    public String getReviews(Model model, HttpSession session) {
        if (session.getAttribute("userId") == null) return "redirect:/login";

        // Note: Ideally this should fetch reviews specific to this customer, 
        // but keeping it as findAll() to match current logic
        List<Review> reviews = reviewRepo.findAll();
        model.addAttribute("reviews", reviews);
        return "c_reviews";
    }

    @PostMapping("/reviews/add")
    public String addReview(
            @RequestParam int starRating, 
            @RequestParam String comment, 
            @RequestParam Long bookingId, 
            HttpSession session) {
        
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        // Fetch the specific booking we are reviewing
        BookRequest booking = bookRequestRepo.findById(bookingId).orElseThrow();

        Review newReview = new Review();
        newReview.setStarRating(starRating);
        newReview.setComment(comment);
        newReview.setBookRequest(booking); 
        
        reviewRepo.save(newReview); // Save the review first!

        // --- NEW: RECALCULATE PROVIDER'S AVERAGE RATING ---
        Provider provider = booking.getProvider();
        
        // Get all reviews for this specific provider
        List<Review> providerReviews = reviewRepo.findAll().stream()
            .filter(r -> r.getBookRequest() != null && 
                         r.getBookRequest().getProvider() != null && 
                         r.getBookRequest().getProvider().getId().equals(provider.getId()))
            .toList();

        if (!providerReviews.isEmpty()) {
            double totalStars = 0;
            for (Review r : providerReviews) {
                totalStars += r.getStarRating();
            }
            // Calculate average and round to 1 decimal place (e.g., 4.7)
            double newAvg = totalStars / providerReviews.size();
            newAvg = Math.round(newAvg * 10.0) / 10.0; 
            
            provider.setRating(newAvg);
            providerRepo.save(provider); // Save the updated rating to the DB
        }

        return "redirect:/customer/reviews";
    }

    // --- EDIT PROFILE ---
    @GetMapping("/profile/edit")
    public String getEditProfile(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        Customer c = customerRepo.findById(userId).orElse(new Customer());
        model.addAttribute("customer", c);
        return "edit_c_profile";
    }

    @PostMapping("/profile/edit")
    public String updateProfile(
            @RequestParam String firstName, 
            @RequestParam String lastName, 
            @RequestParam String email, 
            @RequestParam String phone,
            HttpSession session) {
        
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        Customer c = customerRepo.findById(userId).orElseThrow();
        
        c.setFirstName(firstName);
        c.setLastName(lastName);
        c.setEmail(email);
        c.setPhone(phone);
        c.setNotificationsEnabled(true); 
        
        customerRepo.save(c);
        return "redirect:/customer/dashboard";
    }

    // --- EVENTS ---
    @GetMapping("/events/new")
    public String showCreateEventForm(HttpSession session) {
        if (session.getAttribute("userId") == null) return "redirect:/login";
        return "create_event"; 
    }

    @PostMapping("/events/new")
    public String createEvent(
            @RequestParam String eventName, 
            @RequestParam String eventDate,
            @RequestParam String eventLocation,
            @RequestParam(required = false) String eventType,
            HttpSession session) {
        
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";
        
        Event newEvent = new Event(); 
        
        // Append the category type to the name so it saves to the database seamlessly
        String finalName = (eventType != null && !eventType.isEmpty()) ? eventName + " (" + eventType + ")" : eventName;
        newEvent.setEventName(finalName);
        
        if (eventDate != null && !eventDate.isEmpty()) {
            newEvent.setEventDate(LocalDateTime.parse(eventDate));
        }
        
        newEvent.setLocation(eventLocation); 
        newEvent.setStatus("Planning");

        Customer c = customerRepo.findById(userId).orElseThrow();
        newEvent.setCustomer(c);

        eventService.createEvent(newEvent);
        return "redirect:/customer/dashboard";
    }

    // --- CHECKOUT FLOW ---
    @GetMapping("/checkout")
    public String getCheckout(@RequestParam Long packageId, Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        // Fetch the package the user wants to buy
        ServicePackage pkg = packageRepo.findById(packageId).orElse(null);
        if (pkg == null) return "redirect:/browse";

        // Fetch the customer so we can show their existing events in a dropdown
        Customer customer = customerRepo.findById(userId).orElseThrow();
        
        model.addAttribute("pkg", pkg);
        model.addAttribute("existingEvents", customer.getEvents()); 
        return "c_checkout";
    }

    @PostMapping("/checkout/process")
    public String processCheckout(
            @RequestParam Long packageId,
            @RequestParam(required = false) Long existingEventId, 
            @RequestParam(required = false) String eventName,     
            @RequestParam(required = false) String eventDate,
            @RequestParam(required = false) String eventLocation,
            HttpSession session) {
        
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        Customer customer = customerRepo.findById(userId).orElseThrow();
        ServicePackage pkg = packageRepo.findById(packageId).orElseThrow();

        Event targetEvent;

        //  Use an existing event OR create a new one on the fly
        if (existingEventId != null) {
            targetEvent = eventRepo.findById(existingEventId).orElseThrow();
        } else {
            targetEvent = new Event();
            targetEvent.setEventName(eventName); 
            targetEvent.setCustomer(customer);
            targetEvent.setLocation(eventLocation);
            if (eventDate != null && !eventDate.isEmpty()) {
                targetEvent.setEventDate(LocalDateTime.parse(eventDate));
            }
            targetEvent = eventRepo.save(targetEvent); 
        }

        // Generate the Official Booking Request!
        BookRequest request = new BookRequest();
        request.setEvent(targetEvent);
        request.setProvider(pkg.getProvider());
        request.setServicePackages(List.of(pkg)); 
        request.setStatus(BookRequest.BookingStatus.PENDING);
        request.setTotalPrice(pkg.getPrice());
        
        bookRequestRepo.save(request);

        // Save the request and capture the generated ID
        request = bookRequestRepo.save(request);

        // Instantly create a chat thread for this specific booking!
        Conversation thread = new Conversation();
        thread.setCustomer(customer);
        thread.setProvider(pkg.getProvider());
        thread.setBookRequest(request);
        thread = conversationRepo.save(thread);

        // Auto-send an introductory message from the customer
        Message firstMsg = new Message();
        firstMsg.setThread(thread);
        firstMsg.setSender(customer);
        firstMsg.setContent("Hi! I would like to book your '" + pkg.getTitle() + "' package for my upcoming event.");
        messageRepo.save(firstMsg);

        return "redirect:/customer/dashboard";
    }

    // --- VIEW PROVIDER PROFILE (PUBLIC) ---
    

    @GetMapping("/provider/{providerId}")
    public String viewProviderProfile(@PathVariable Long providerId, Model model, HttpSession session) {
        // We still want them logged in as a customer to view this properly
        if (session.getAttribute("userId") == null) return "redirect:/login";

        // Fetch the Provider
        Provider provider = providerRepo.findById(providerId).orElse(null);
        if (provider == null) return "redirect:/browse";

        // Fetch the Provider's active packages
        List<ServicePackage> packages = packageRepo.findByProviderId(providerId).stream()
            .filter(pkg -> pkg.getStatus() == ServicePackage.PackageStatus.ACTIVE)
            .toList();

        // Fetch the Provider's reviews
        List<Review> reviews = reviewRepo.findAll().stream()
            .filter(r -> r.getBookRequest() != null && 
                         r.getBookRequest().getProvider() != null && 
                         r.getBookRequest().getProvider().getId().equals(providerId))
            .toList();

        model.addAttribute("provider", provider);
        model.addAttribute("packages", packages);
        model.addAttribute("reviews", reviews);

        return "c_provider_profile";
    }

}
   

