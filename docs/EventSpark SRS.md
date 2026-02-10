
# Requirements – Starter Template

**Project Name:** EventSpark
**Team:** Jeremy Mayas (Customer), Levi Duquette (Provider)
**Course:** CSC 340
**Version:** 1.0
**Date:** 2026-07-30

---

## 1. Overview
**Vision.** Anyone who has ever struggled to plan something be it hard to put the word out, finding a place to have an event or group walk and others. The goal is to make it easier for people to plan things easier.

**Glossary** Terms used in the project
- **Plan/Engage: Allow people to follow hosts to be up to date with their events** .
- **Effeciency: Allow for a simple quick solution to planning and hosting** 

**Primary Users / Roles.**
- **Customer (e.g., Student/Patient/Pet Owner/etc. )** — Participants, friends, and family.
- **Provider (e.g., Teacher/Doctor/Pet Sitter/etc. )** — Hosts, Community managers.

**Scope (this semester).**
- <Browse Events for using filters and searching>
- <Create possible base sets of events for common events people usually throw.>
- <Reviews for quality assurance>

**Out of scope (deferred).**
- <Starter pack deliveries for novice planners>
- <Spot recommendations>

> This document is **requirements‑level** and solution‑neutral; design decisions (UI layouts, API endpoints, schemas) are documented separately.

---

## 2. Functional Requirements (User Stories)
Write each story as: **As a `<role>`, I want `<capability>`, so that `<benefit>`.** Each story includes at least one **Given/When/Then** scenario.

### 2.1 Customer Stories
- **US‑CUST‑001 — <Profiles>**  
  Story: As a customer, I want to make a profile so that I can favorite, review and keep track of events I attend.  
  _Acceptance:_

  Scenario: <Profile Creation>  
    Given <Havenn't signed-up>  
    When  <Given created password and some basic information about them.> 
    Then  <Profile is created and customizable> 


- **US‑CUST‑002 — <Browse events>**  
  _Story:_ As a customer, I want to browse events so that I may select what I wish to attend.  
  _Acceptance:_
  
  Scenario: <Browse events> 
    Given <Any events occuring>  
    When  <I search or log in>  
    Then  <Events appear and selectable for attending.> 

### 2.2 Provider Stories
- **US‑HOST-001 — <Create/Manage Profile>**  
  _Story:_ As a provider, I want to create and manage my profile so customers can verify up to date info on my services.  
  _Acceptance:_
  
  Scenario: <Successful profile update> 
    Given <I am a registered provider.> 
    When  <I add or update details on my public profile.>
    Then  <The profile is saved and visible on the main event page.>

- **US‑HOST-002 — <Create Event Packages>**  
  _Story:_ As a provider, I want to list different service packages with clear pricing so that customers can easily browse and book packages they want.   
  _Acceptance:_
  
  Scenario: <Publish a new package>
    Given <My profile is active.>
    When  <I enter a package title, price, and contents list.>
    Then  <The package appears as an option on my provider page.>
  
- **US‑HOST-003 — <Manage Booking Calendar>**  
  _Story:_ As a provider, I want to mark specific dates as 'Busy,' or 'Unavailable' or have the event automatically marked such when request is approved so booking requests do not overlap.   
  _Acceptance:_
  
  Scenario: <Prevent double-booking>
    Given <I have an event scheduled on February 12th OR request for February 12th.>
    When  <I mark February 12th as unavailable on my provider dashboard OR I accept a request from customer>
    Then  <The date is greyed out and cannot be selected by customers.>
  
- **US‑HOST-004 — <Process Booking Requests>**  
  _Story:_ As a provider, I want to recieve notifications for new booking requests so that I can approve/deny them based on request and event details.  
  _Acceptance:_
  
  Scenario: <Approve a request>
    Given <A customer has requested a specific date.>
    When  <I click a button to approve request in my inbox or profile.>
    Then  <The customer is notified of the booking, and the event is added to my upcoming schedule.>
  
- **US‑HOST-005 — <Respond to Customer Feedback>**  
  _Story:_ As a provider, I want to reply to reviews left by customers so that I can maintain a professional reputation and address any concerns publicly. 
  _Acceptance:_
  
  Scenario: <Replying to positive review>
    Given <Customer leaves a 5-star rating on my profile>
    When  <I submit a Thank You response.>
    Then  <My reply is nested directly underneath the review for other potential customers to see.>

- **US‑HOST-006 — <Promotional Media Gallery>**  
  _Story:_ As a provider, I want to upload high-quality photos and videos of my past events so that I can provide evidence of my skills to potential customers. 
  _Acceptance:_
  
  Scenario: <Successful Media Upload>
    Given <I am on my profile page in edit mode.>
    When  <I upload a file and tag it as what type of event it was.>
    Then  <The media appears in my public gallery carousel for customers to view.>
  
- **US‑HOST-007 — <Travel and Service Area Radius>**  
  _Story:_ As a provider, I want   
  _Acceptance:_
  
  Scenario: <>
    Given <>
    When  <>
    Then  <>

- **US‑HOST-008 — <Direct Message with Clients>**  
  _Story:_ As a provider, I want   
  _Acceptance:_
  
  Scenario: <>
    Given <>
    When  <>
    Then  <>
  
- **US‑HOST-009 — <Track Performance Analytics>**  
  _Story:_ As a provider, I want   
  _Acceptance:_
  
  Scenario: <>
    Given <>
    When  <>
    Then  <>

- **US‑HOST-010 — <Service Category Tagging>**  
  _Story:_ As a provider, I want   
  _Acceptance:_
  
  Scenario: <>
    Given <>
    When  <>
    Then  <>

---

## 3. Non‑Functional Requirements (make them measurable)
- **Performance:** 
- **Availability/Reliability:** 
- **Security/Privacy:** Star covered password, limited attempts.
- **Usability:** New users will be able to attend right after acoount creation/completion

---

## 4. Assumptions, Constraints, and Policies
- Browsers: (Chrome, Edge, Opera, Firefox) etc.
- User location, and TOD will apply.
- Reviews only allowed if event attended, including content guidelines.

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
