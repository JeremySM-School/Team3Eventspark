# EventSpark Requirements Testing Plan

**Project Name:** EventSpark  
**Version:** 1.0  
**Date:** 2026-05-05  
**Purpose:** This document outlines comprehensive test scenarios for each functional requirement (user story) in the EventSpark system, derived from the Software Requirements Specification (SRS).

## Actors
- **Provider P:** Service Provider (e.g., DJ, Artist, Photographer)
- **Customer C:** Event Organizer
- **Service S:** Service Package

## Use Cases

#### 1. Customer: US‑CUST‑001 — Register & manage profile
1. Customer C1 logs in for the first time and creates a profile.
2. C1 edits their profile to add personal information and preferences.
3. C1 exits the application.

#### 2. Provider: US‑HOST‑001 — Create/Manage Profile, US‑HOST‑002 — Create Event Packages, US‑HOST‑010 — Service Category Tagging
1. Provider P1 logs in for the first time and creates a professional profile.
2. P1 creates new service packages S1 and S2 with specific titles, prices, and descriptions.
3. P1 tags their profile with categories like "Wedding DJ" or "Photographer" to improve searchability.
4. P1 exits the app.

#### 3. Customer: US‑CUST‑002 — Browse events, US‑CUST‑003 — Browse events by activity, US‑CUST‑004 — View details
1. Customer C2 logs in and searches for a service provider.
2. C2 filters search results by activity type (e.g., "DJ").
3. C2 selects a provider to view specific service details including location, starting price, and availability.

#### 4. Customer: US‑CUST‑010 — Cancel Service, US‑HOST‑004 — Process Booking Requests, US‑HOST‑008 — Direct Message with Clients
1. Customer C2 requests a booking for service S1 from Provider P1.
2. P1 receives a notification, messages C2 via the 'Booking' portal to clarify details, and approves the request.
3. C2 receives an alert that the booking is accepted (US-CUST-008).
4. C2 later decides to cancel the booking before the event starts; P1 is notified of the cancellation.

#### 5. Customer: US‑CUST‑006 — Write a review, US‑CUST‑007 — Read reviews, US‑HOST‑005 — Respond to Customer Feedback
1. Customer C2 completes an event and writes a review for Provider P1.
2. Customer C1 logs in, reads the review left by C2, and decides to book P1 based on the feedback.
3. Provider P1 logs in, reads the review, and submits a 'Thank You' response.

#### 6. Provider: US‑HOST‑003 — Manage Booking Calendar, US‑HOST‑009 — Track Performance Analytics
1. Provider P1 opens their dashboard and views engagement metrics (profile views, package clicks).
2. P1 marks a specific date as 'Unavailable' on their calendar.
3. C1 attempts to book that date and finds it greyed out/unavailable.

#### 7. Advanced Provider Features: US‑HOST‑006 — Promotional Media Gallery, US‑HOST‑007 — Travel and Service Area Radius
1. Provider P1 uploads high-quality photos of past events to their gallery.
2. P1 sets a travel radius of 50 miles.
3. Customer C1, located 60 miles away, searches for P1's service type but P1 does not appear in the results.

## CROSS-CUTTING TEST SCENARIOS (Non-Functional Requirements)

### Performance Requirements

**Scenario P1: Search/Discovery response time ≤ 2.0 seconds**
- **Setup:** Server under typical load with multiple providers and packages.
- **Steps:**
  1. Measure response time for "Browse Services" page load and search queries.
  2. Repeat 10 times.
- **Expected Outcome:** 95% of requests ≤ 2.0 seconds.

**Scenario P2: Profile page load ≤ 1.5 seconds**
- **Setup:** Provider profile containing media gallery.
- **Steps:**
  1. Measure load time for a provider profile page.
  2. Repeat 10 times.
- **Expected Outcome:** 99% of requests ≤ 1.5 seconds.

### Security & Privacy Requirements

**Scenario S1: Role-based access control**
- **Setup:** Customer user attempts to access provider-specific management routes.
- **Steps:**
  1. Customer logs in.
  2. Attempts to navigate to "/provider/dashboard" or package management pages.
- **Expected Outcome:** Access is denied; user is redirected to an appropriate landing page.

**Scenario S2: Private contact information protection**
- **Setup:** Customer views provider profile.
- **Steps:**
  1. Customer browses to a provider's profile.
  2. Checks for visibility of private contact information (e.g., personal phone/email).
- **Expected Outcome:** Private contact info remains hidden until after a booking is approved.

### Usability Requirements

**Scenario U1: New Provider creates first package in ≤ 5 minutes**
- **Setup:** Fresh provider account.
- **Steps:**
  1. Provider logs in.
  2. Navigates to "Create Package".
  3. Fills in title, price, and description and submits.
  4. Record total time.
- **Expected Outcome:** Time to complete ≤ 5 minutes.

**Scenario U2: Date blocking prevents double booking**
- **Setup:** Two customers attempting to book the same date.
- **Steps:**
  1. Provider approves a booking for February 12th.
  2. Second customer attempts to request February 12th.
- **Expected Outcome:** The date is unavailable for the second customer.
