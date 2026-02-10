
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

  Scenario: Profile Creation
    Given Haven't signed-up
    When  Given created password and some basic information about them.
    Then  Profile is created and customizable


- **US‑CUST‑002 — Browse events**  
  _Story:_ As a customer, I want to browse events so that I may select what I wish to attend.  
  _Acceptance:_
  
  Scenario: Browse events
    Given Any events occuring
    When  I search or log in
    Then  Events appear and selectable for attending.


- **US‑CUST‑003 — Browse events by activity**  
  _Story:_ As a customer, I want to browse events based on their acivity so I know whats going on in the event before attending.  
  _Acceptance:_
  
  Scenario: Sort by activity
    Given Multiple events occuring
    When  I search by activity
    Then  Events appear based on activity search query.


- **US‑CUST‑004 — View details**  
  _Story:_ As a customer I want to see event details when I select an event to learn more about specifics like location, all activities, place, time and more.  
  _Acceptance:_
  
  Scenario: View details
    Given Event is occurring
    When  I select an event
    Then  Event additional details menu appears.


- **US‑CUST‑005 — Follow host**  
  _Story:_ As a customer I want to follow a host to know when they plan or make events.  
  _Acceptance:_
  
  Scenario: Follow host
    Given Host exists and has made a previous event
    When  I follow the host
    Then  I will know when they plan more events.


    - **US‑CUST‑006 — Write a review**  
  _Story:_   As a customer I want to write a review after attending a host's event to let others know how the experience was with this host leading the event's activity, location etc.
  _Acceptance:_
  
  Scenario: Review is open to write after attending
    Given Event ended, and user is logged in
    When  I write a review
    Then  Event review appears under host event for others to see.


- **US‑CUST‑007 — Read reviews**  
  _Story:_ As a customer I want to view host reviews before attending their events  
  _Acceptance:_
  
  Scenario: List host reviews
    Given Event was planned and complete by host
    When  I open their reviews
    Then  Event I see their most recent and popular reviews


    - **US‑CUST‑008 — Enable notifications**  
  _Story:_ .  As a customer I want to know when events I selected to attend are nearing their start date.
  _Acceptance:_
  
  Scenario: Enable notifications
    Given Event is about to start
    When  I enable notifications
    Then  Event alert appears for me to know its about to start.


- **US‑CUST‑009 — Filter notifications**  
  _Story:_ .  As a customer I want to filter notifications so I don't get information I don't want or need.
  _Acceptance:_
  
  Scenario: Filter notifications
    Given Notifications enabled
    When  I filter or restrict them
    Then  Limited notifications or none will appear for the user.

    - **US‑CUST‑010 — Leave event**  
  _Story:_ .  As a customer if something comes up or I simply no longer wish to attend the event I would like to leave it.
  _Acceptance:_
  
  Scenario: Customer no longer wishes to attend
    Given Event hasnt begun
    When  I select leave or no longer attending
    Then  Customer is no longer on participant list.

  



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
