
# Requirements – Starter Template

**Project Name:** EventSpark
**Team:** Jeremy Mayas (Customer), Levi Duquette (Provider)
**Course:** CSC 340
**Version:** 1.0
**Date:** 2026-07-30

---

## 1. Overview
**Vision.** Anyone who has ever struggled to plan something be it hard to put the word out, finding a place to have an event or group walk and others. TeamEventSpark is a web-based marketplace that connects event organizers to professional service providers such as DJs, live artists, photographers, etc. The goal is to make it easier for people to plan things easier. Customers will be able to discover service providers, explore specific service packages, and book these services for their events. Service Providers will be able to offer up their services, manage their availability, professional portfolio, and interact with the customer feedback to build up reputation.

**Glossary** Terms used in the project
- **Provider: A user who offers their professional event services (i.e. DJ, Artist, Musician, Photographer, etc).**
- **Package: A specific service bundle offered by a provider with a set price and description.**
- **Booking: A scheduled agreement between Customer and a Provider for a specific service package.**
- **Service Area: The geographic radius within where a Provider is willing to travel for an event.**

**Primary Users / Roles.**
- **Customer (Event Organizer)** — Finds and books talent; manages event schedule; reviews providers
- **Provider (Service Provider)** — Publishes service packages; manage booking availability; responds to reviews.

**Scope (this semester).**
- Discover events for using filters such as service category, price, location
- User registration and profile management for Customers and Providers
- Provider package creation/management
- Booking request workflow (request, approve, deny).
- Public review system with provider replies

**Out of scope (deferred).**
- Online payment processing and automated invoicing
- Legal contracts for service
- Live streaming of events

> This document is **requirements‑level** and solution‑neutral; design decisions (UI layouts, API endpoints, schemas) are documented separately.

---

## 2. Functional Requirements (User Stories)

### 2.1 Customer Stories
- **US‑CUST‑001 — Profiles**  
  Story: As a customer, I want to make a profile so that I can favorite, review and keep track of events I attend.  
  _Acceptance:_

  ```gherkin
  Scenario: <Profile Creation>  
    Given <Haven't signed-up>  
    When  <Given created password and some basic information about them.> 
    Then  <Profile is created and customizable> 
  ```

- **US‑CUST‑002 — Browse events**  
  _Story:_ As a customer, I want to browse services so that I may select what I wish to book.  
  _Acceptance:_
  
```gherkin
  Scenario: <Browse events> 
    Given <I have an event>  
    When  <I need to browse for aservice>  
    Then  <I can search for a service provider.> 
```

**US‑CUST‑003 — Browse events by activity**  
  _Story:_ As a customer, I want to browse services based on their acivity so I know what the provider offers before booking.  
  _Acceptance:_

```gherkin
  Scenario: <Sort by activity>
    Given <Multiple providers listed>
    When  <I search by activity>
    Then  <Service providers appear based on activity search query.>
```

- **US‑CUST‑004 — View details**  
  _Story:_ As a customer I want to see servcice details when I select a service provider to learn more about specifics like location, starting price, availability.  
  _Acceptance:_

```gherkin
  Scenario: <View details>
    Given <Service is offered>
    When  <I select a service>
    Then  <Additional details menu appears.>
```

- **US‑CUST‑005 — Follow providers**  
  _Story:_ As a customer I want to follow a provider so I know when they might be available again.  
  _Acceptance:_
  
```gherkin
  Scenario: <Follow provider>
    Given <Provider exists and has offered services before>
    When  <I follow the provider>
    Then  <I will know when they plan more service offerings.>
```

- **US‑CUST‑006 — Write a review**  
  _Story:_   As a customer I want to write a review after using a provider's service to let others know how the experience was with this provider like reliability, affordability, communication, etc
  _Acceptance:_
  
```gherkin
  Scenario: <Review is open to write after booking has ended>
    Given <Event ended, and user is logged in>
    When  <I write a review>
    Then  <Event review appears under provider page for others to see.>
```

- **US‑CUST‑007 — Read reviews**  
  _Story:_ As a customer I want to view provider reviews before booking their service  
  _Acceptance:_
  
```gherkin
  Scenario: <List provider reviews>
    Given <Event was attended by service provider>
    When  <I open their reviews>
    Then  <I see their most recent and popular reviews from event>
```

- **US‑CUST‑008 — Enable notifications**  
  _Story:_ .  As a customer I want to know when service providers have accepted bookings or getting close to service date.
  _Acceptance:_
  
```gherkin
  Scenario: <Enable notifications>
    Given <Event is about to start>
    When  <I enable notifications>
    Then  <Event alert appears for me to know its about to start and if services requested are accepted.>
```

- **US‑CUST‑009 — Filter notifications**  
  _Story:_ .  As a customer I want to filter notifications so I don't get information I don't want or need.
  _Acceptance:_
  
```gherkin
  Scenario: <Filter notifications>
    Given <Notifications enabled>
    When  <I filter or restrict them>
    Then  <Limited notifications or none will appear for the user.>
```

- **US‑CUST‑010 — Cancel Serivce**  
  _Story:_ .  As a customer if something comes up or I simply no longer wish to use the service I would like to cancel it.
  _Acceptance:_
  
```gherkin
  Scenario: <Customer no longer wishes to host their event>
    Given <Event hasnt begun>
    When  <I select cancel booking>
    Then  <Service provider is cancelled for their booking.>
```


### 2.2 Provider Stories
- **US‑HOST-001 — Create/Manage Profile**  
  _Story:_ As a provider, I want to create and manage my profile so customers can verify up to date info on my services.  
  _Acceptance:_

```gherkin  
  Scenario: <Successful profile update> 
    Given <I am a registered provider.> 
    When  <I add or update details on my public profile.>
    Then  <The profile is saved and visible on the main event page.>
```

- **US‑HOST-002 — Create Event Packages**  
  _Story:_ As a provider, I want to list different service packages with clear pricing so that customers can easily browse and book packages they want.   
  _Acceptance:_
  
```gherkin
  Scenario: <Publish a new package>
    Given <My profile is active.>
    When  <I enter a package title, price, and contents list.>
    Then  <The package appears as an option on my provider page.>
```
  
- **US‑HOST-003 — Manage Booking Calendar**  
  _Story:_ As a provider, I want to mark specific dates as 'Busy,' or 'Unavailable' or have the event automatically marked such when request is approved so booking requests do not overlap.   
  _Acceptance:_
  
```gherkin
  Scenario: <Prevent double-booking>
    Given <I have an event scheduled on February 12th OR request for February 12th.>
    When  <I mark February 12th as unavailable on my provider dashboard OR I accept a request from customer>
    Then  <The date is greyed out and cannot be selected by customers.>
```
  
- **US‑HOST-004 — Process Booking Requests**  
  _Story:_ As a provider, I want to recieve notifications for new booking requests so that I can approve/deny them based on request and event details.  
  _Acceptance:_

```gherkin  
  Scenario: <Approve a request>
    Given <A customer has requested a specific date.>
    When  <I click a button to approve request in my inbox or profile.>
    Then  <The customer is notified of the booking, and the event is added to my upcoming schedule.>
```
  
- **US‑HOST-005 — Respond to Customer Feedback**  
  _Story:_ As a provider, I want to reply to reviews left by customers so that I can maintain a professional reputation and address any concerns publicly. 
  _Acceptance:_
  
```gherkin
  Scenario: <Replying to positive review>
    Given <Customer leaves a 5-star rating on my profile>
    When  <I submit a Thank You response.>
    Then  <My reply is nested directly underneath the review for other potential customers to see.>
```

- **US‑HOST-006 — Promotional Media Gallery**  
  _Story:_ As a provider, I want to upload high-quality photos and videos of my past events so that I can provide evidence of my skills to potential customers. 
  _Acceptance:_
  
```gherkin
  Scenario: <Successful Media Upload>
    Given <I am on my profile page in edit mode.>
    When  <I upload a file and tag it as what type of event it was.>
    Then  <The media appears in my public gallery carousel for customers to view.>
```
  
- **US‑HOST-007 — Travel and Service Area Radius**  
  _Story:_ As a provider, I want to set a maximum travel distance from my main location so that I ony recieve booking requests for events that I can realistically attend.   
  _Acceptance:_

```gherkin 
  Scenario: <Filtered booking requests>
    Given <I have set my travel radius to 50 miles/>
    When  <A customer searches for my event type 60 miles away>
    Then  <My profile does not appear in their search results.>
```

- **US‑HOST-008 — Direct Message with Clients**  
  _Story:_ As a provider, I want to message customers who have requested a booking so that I can clairfy any event details.   
  _Acceptance:_
  
```gherkin 
  Scenario: <Sending a message>
    Given <I have a pending or confirmed booking>
    When  <I send a message through the 'Booking' portal>
    Then  <The customer recieves a notification of said message and can reply back within the platform or via SMS>
```
  
- **US‑HOST-009 — Track Performance Analytics**  
  _Story:_ As a provider, I want to see how many people have viewed my profile, clicked on packages, or purchased packages/booked so that I can adjust my pricing or media to attract more bookings.  
  _Acceptance:_
  
```gherkin 
  Scenario: <View engagement metrics>
    Given <I open my 'Provider Dashboard'>
    When  <I select 'Last 30 Days' for analytics>
    Then  <I see the total number of profile views, packages clicked, and packages purchased.>
```

- **US‑HOST-010 — Service Category Tagging**  
  _Story:_ As a provider, I want to tage my profile with specific genres/categories like Wedding DJ, painter, etc so that I show up in filtered searches.
  _Acceptance:_
  
```gherkin 
  Scenario: <Filtered discovery>
    Given <I have tagged myself as a 'Wedding Photographer'>
    When  <A customer filters their search by 'Wedding' services>
    Then  <my profile will be included in the search list>
```

---

## 3. Non‑Functional Requirements (make them measurable)
- **Performance:** 95% of search/discovery should load in ≤ 2 seconds; profile pages with media galleries should load in ≤ 1.5 seconds
- **Availability/Reliability:** Platform should maintain ≥ 99% uptime. Since this is a booking site, we want the sytem to ensure that once a date is marked "Busy," it is blocked for all other users to prevent double booking.
- **Security/Privacy:** Hash/Star covered password, limited attempts. Provider's private contact information should only be revealed AFTER a booking request is approved
- **Usability:** New Providers should be able to create their first "Service Package" in under 5 minnutes without needing much of a tutorial.

---

## 4. Assumptions, Constraints, and Policies
- Browsers: (Chrome, Edge, Opera, Firefox) etc. Stable internet connection required.
- Providers are responsible for the accuracy of their own availability calendars.
- User location, and TOD will apply.
- Reviews only allowed if event attended, including content guidelines.
- Canellation Policy, refund discussions happen externally between Customer/Provider (system does not handle payments)
- Content Policy: Any media uploaded must be professional and related to service, anything inappropriate with result in account suspension

---

## 5. Milestones (course‑aligned)
- **M2 Requirements** — this file + stories opened as issues. 
- **M3 High‑fidelity prototype** — core customer/provider flows fully interactive. 
- **M4 Design** — architecture, schema, API outline. 
- **M5 Backend API** — key endpoints + tests. 
- **M6 Increment** — ≥2 use cases end‑to‑end. 
- **M7 Final** — complete system & documentation. 

---

## 6. Change Management
- Stories are living artifacts; changes are tracked via repository issues and linked pull requests.  
- Major changes should update this SRS.
