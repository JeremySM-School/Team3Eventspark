# MVC Implementation Mapping

This directory contains the core Spring Boot application. Below is the mapping of our primary User Stories to their specific Model, View, and Controller implementations.

### 1. Browse Services & View Profiles (US-CUST-002, US-CUST-003)
* **Controller:** `CustomerUIController.java` (`/browse`, `/customer/provider/{id}`)
* **Model:** `ServicePackage.java`, `Provider.java`, `ServicePackageRepository`
* **View:** `browse_services.ftlh`, `c_provider_profile.ftlh`
* **Flow:** The controller fetches active packages from the database, maps them to the model, and passes them to the FreeMarker template where they are dynamically rendered as filterable cards. Viewing a profile increments the `profileViews` attribute on the Provider model.

### 2. Transactional Chat & Booking Approvals (US-HOST-003, US-CUST-007)
* **Controller:** `ProviderUIController.java` (`/provider/messages`, `/provider/inbox/update`)
* **Model:** `Conversation.java`, `Message.java`, `BookRequest.java`
* **View:** `p_messages.ftlh`, `c_inbox.ftlh`
* **Flow:** When a checkout occurs, a `Conversation` entity is generated and linked to the `BookRequest`. The chat UI pins the `BookRequest` to the top of the screen. Submitting an "Approve" form triggers the controller to update the Enum status of the `BookRequest` model to `APPROVED` and re-renders the chat view.

### 3. Dynamic Reviews & Rating Calculation (US-CUST-006, US-HOST-006)
* **Controller:** `CustomerUIController.java` (`/customer/reviews/add`), `ProviderUIController.java` (`/provider/dashboard`)
* **Model:** `Review.java`, `Provider.java`, `ReviewRepository`
* **View:** `p_dashboard.ftlh`, `c_provider_profile.ftlh`
* **Flow:** When a Customer submits a review, the Controller intercepts the POST request, saves the `Review` model, and instantly calculates the new mathematical average across all reviews tied to that Provider. This ensures the `p_dashboard.ftlh` always reflects real-time analytical data.

### 4. Service Package Management & Portfolio (US-HOST-001, US-HOST-002)
* **Controller:** `ProviderUIController.java` (`/provider/packages/new`, `/provider/profile/edit`)
* **Model:** `ServicePackage.java`, `Provider.java`
* **View:** `edit_p_profile.ftlh`, `packages.ftlh`
* **Flow:** Providers can submit comma-separated image URLs via the edit profile form. The Controller splits this string into a `List<String>` and persists it to the Provider model. The `c_provider_profile.ftlh` View then loops through this list to populate a Bootstrap Carousel natively.
