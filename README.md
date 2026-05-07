

## Title
🌟 EventSpark

## Team Members
> Jeremy Mayas

> Levi Duquette

## Project Summary
> EventSpark simplifies the event planning process. Customers can discover specific service packages (e.g., DJ setups, Catering menus), attach them to upcoming events, and request bookings. Providers manage these requests through a messaging hub, allowing them to negotiate, approve, or decline jobs directly within the chat interface. Approved jobs automatically transition to a calendar and a read-only historical ledger for financial tracking.


## System Compartmentalization (Architecture)
The project strictly adheres to the Model-View-Controller (MVC) architectural pattern, utilizing the Spring Boot framework:

1.  **The View Layer (Frontend):** Built using FreeMarker (`.ftlh`) templating engine, HTML5, and Bootstrap 5. It is divided into two distinct UI flows (Customer and Provider), ensuring strict separation of concerns and role-based data isolation.
2.  **The Controller Layer (Routing & Logic):** Handled by Spring MVC `@Controller` classes (`CustomerUIController`, `ProviderUIController`). These intercept HTTP requests, enforce session-based authorization, process business logic (e.g., calculating dynamic review averages), and route data to the appropriate Views.
3.  **The Model Layer (Data Access & Schema):** Defined by JPA `@Entity` classes and Spring Data JPA `Repositories`. This layer handles all direct database transactions, relational mappings (One-to-Many, Many-to-Many), and data persistence.
4.  **The Database Layer:** A relational PostgreSQL database managing the persisted state of Users, Service Packages, Booking Requests, and Messages.


## App Functions
1. Customer (Jeremy Mayas):
    1. Create/modify customer profile - Registar as a host or a participant.
    2. View available services - Browse all public events avaliable.
    3. Subscribe to available services - Subscribe to certain hosts to recieve subscriber only benefits to events.
    4. Write reviews for subscribed services - Review events and parties for activity, quality and experience.
2. Provider (Levi Duquette):
    1. Create/modify/remove provider profile - Manage professional profiles like business name, service category, and portfolio through a dashboard setting
    2. Create services - list specific services/event packages with pricing and availability details
    3. View customer statistics - Show providers how many quotes they have sent, their booking rate, and which service packages are most popular
    4. Reply to reviews - Respond back directly to customer feedback to maintain their 'vetted' status and build trust with future clients
