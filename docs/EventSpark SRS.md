
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
