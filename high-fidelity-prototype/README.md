# ✨ EventSpark

**EventSpark** is a web-based platform designed to connect event planners (Customers) with top-tier talent and service professionals (Providers) such as DJs, musicians, photographers, and live artists. 

This repository contains the high-fidelity static HTML/CSS prototype developed for Milestone 3, demonstrating the core user flows, responsive UI, and system architecture outlined in our Software Requirements Specification (SRS).

---

## Key Features

### For Customers (Event Planners)
* **Discover Talent:** Browse and filter providers by category (e.g., DJs, Live Bands), price range, and rating.
* **Event Wizard:** Plan an event by selecting the date, location, and multiple required services at once.
* **Streamlined Booking:** View provider profiles, select specific service packages, and submit booking requests with mock checkout.
* **Dashboard Management:** Track upcoming events, view pending requests, and manage a "Saved Favorites" wishlist.
* **Communication & Feedback:** Send messages to providers via the Inbox and leave post-event star ratings and reviews.

### For Providers (Talent & Services)
* **Profile Management:** Edit public-facing profiles with biographies, service radiuses, profile tags, and media galleries.
* **Package Creation:** Create and manage distinct service packages with custom pricing and features.
* **Booking Pipeline:** Accept or deny incoming booking requests directly from the Inbox.
* **Calendar & Agenda:** View a monthly visual calendar and a detailed agenda of upcoming confirmed gigs.
* **Reputation Management:** Track profile views, monthly revenue, and respond to customer reviews publicly.

---

## Tech

* **HTML5:** Semantic structuring across 15+ interconnected views.
* **CSS3:** Custom "Woody & Vanilla" theme utilizing CSS variables for consistent global branding.
* **Bootstrap 5.3:** Responsive grid system, layout utilities, and mobile-friendly navigation.
* **Bootstrap Icons:** UI elements and status indicators.
* **UI-Avatars API:** Dynamic generation of placeholder profile pictures.

---

## Project Structure

The project is divided into three main subsystems:

```text
EventSpark/
│
├── home/                   # Public-facing pages & Global Assets
│   ├── browse_services.html # Talent discovery and filtering
│   ├── home.html           # Landing page
│   ├── login.html          # Unified login gateway
│   ├── signup.html         # Unified registration gateway
|
│── styles.css          # Global theme variables and overrides
│
├── customer/               # Customer (Event Planner) Subsystem
│   ├── booking_form.html   # Package selection and event details
│   ├── c_bookings.html     # Schedule of confirmed/pending events
│   ├── c_dashboard.html    # Customer hub and favorites list
│   ├── c_inbox.html        # Provider communications
│   ├── c_reviews.html      # Post-event review submission
│   ├── checkout.html       # Mock payment gateway
│   ├── create_event.html   # Multi-service event planning
│   └── edit_c_profile.html # Account and notification settings
│
└── provider/               # Provider (Talent) Subsystem
    ├── calendar.html       # Visual availability and agenda
    ├── edit_p_profile.html # Private settings and gallery upload
    ├── p_dashboard.html    # Provider hub and analytics
    ├── p_inbox.html        # Booking approvals and messages
    ├── p_profile.html      # Public-facing provider page
    ├── p_reviews.html      # Reputation management
    └── packages.html       # Service and pricing configuration

---

## Things we will add in the future updates:
* **home.html** Banner image on home page
* **c_bookings** Separate bookings/events for customer in two columns
* **p_dashboard** Inbox/Notifications separate

