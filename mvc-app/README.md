# 🌟 EventSpark

EventSpark is a full-stack Spring Boot web application that serves as a dynamic, dual-sided marketplace connecting Event Planners (Customers) with Event Talent (Providers). 

It features a fully relational database architecture, real-time "Rover-style" messaging, dynamic booking workflows, and automated financial ledgers.

## 🚀 Features
* **Dual-User Architecture:** Distinct Dashboards, Profiles, and UI flows for both Customers and Providers.
* **Modern Booking Workflow:** Customers can browse talent, view public profiles, and attach services directly to their planned events.
* **Transactional Chat Hub:** A unified messaging interface where Providers can chat with Customers and Approve/Decline bookings directly from the chat widget.
* **Automated Financial Ledger:** Approved bookings automatically transition into a read-only historical ledger for the Provider's financial tracking.
* **Dynamic UI:** Built with FreeMarker (`.ftlh`) and Bootstrap 5 for a responsive, modern interface.

---

## 🛠️ Tech Stack
* **Backend:** Java, Spring Boot (Spring Web, Spring Data JPA)
* **Frontend:** HTML5, Bootstrap 5, FreeMarker Templating Engine
* **Database:** Relational Database (via Spring Data JPA)
* **Icons & Avatars:** Bootstrap Icons, UI-Avatars API

---

## ⚙️ Prerequisites
Before running this project, ensure you have the following installed on your machine:
* **Java Development Kit (JDK) 17** or higher
* **Maven** (or use the included Maven wrapper `./mvnw`)
* A modern web browser (Chrome, Firefox, Safari, Edge)

---

## How to Run the Application

### Option 1: Using an IDE (IntelliJ IDEA, Eclipse, VS Code)
1. Open your IDE and select **"Open"** or **"Import Project"**.
2. Navigate to the root directory of EventSpark (where the `pom.xml` is located).
3. Allow the IDE to download the required Maven dependencies.
4. Locate the main application class (e.g., `EventSparkApplication.java`).
5. Click the **Run** (Play) button.

### Option 2: Using the Command Line (Terminal/Command Prompt)
1. Open your terminal and navigate to the root directory of the project.
2. Run the application using the Maven wrapper:
   * **Mac/Linux:** `./mvnw spring-boot:run`
   * **Windows:** `mvnw.cmd spring-boot:run`
   *(Note: If you have Maven installed globally, you can also just use `mvn spring-boot:run`)*

---

## 🌐 Accessing the Application
Once the Spring Boot application has successfully started (look for `Started EventSparkApplication in X seconds` in the console):

1. Open your web browser.
2. Navigate to: **`http://localhost:8080`**

### Testing & Demo Instructions
To fully experience the application's dual-sided nature without cross-session interference:
1. Open a standard browser window and log in/sign up as a **Provider**.
2. Open an **Incognito/Private Browsing** window and log in/sign up as a **Customer**.
3. You can now act as both users simultaneously to test the real-time booking and messaging flows!