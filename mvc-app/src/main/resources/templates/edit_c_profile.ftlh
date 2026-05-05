<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Profile | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg custom-navbar">
        <div class="container">
            <a class="navbar-brand fs-3" href="/">EventSpark</a>
            <a class="nav-link text-light" href="/customer/dashboard">Back to Dashboard</a>
        </div>
    </nav>

    <div class="card p-4 shadow-sm">
    <form action="/customer/profile/edit" method="POST">
        <div class="text-center mb-4">
            <div class="bg-secondary rounded-circle mx-auto mb-2" style="width: 100px; height: 100px;"></div>
            <button type="button" class="btn btn-sm btn-outline-secondary">Change Photo</button>
        </div>

        <div class="mb-3">
            <label class="form-label fw-bold">First Name</label>
            <input type="text" name="firstName" class="form-control" value="${customer.firstName!''}" required>
        </div>

        <div class="mb-3">
            <label class="form-label fw-bold">Last Name</label>
            <input type="text" name="lastName" class="form-control" value="${customer.lastName!''}" required>
        </div>

        <div class="mb-3">
            <label class="form-label fw-bold">Email Address</label>
            <input type="email" name="email" class="form-control" value="${customer.email!''}" required>
        </div>

        <div class="mb-3">
            <label class="form-label fw-bold">Phone Number</label>
            <input type="tel" name="phone" class="form-control" value="${customer.phone!''}">
        </div>

        <hr>

        <div class="mb-4">
            <label class="form-label fw-bold">Notification Preferences</label>
            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" name="notificationsEnabled" id="notifSwitch" checked>
                <label class="form-check-label" for="notifSwitch">Email Notifications</label>
            </div>
        </div>

        <button type="submit" class="btn btn-primary w-100" style="background-color: #4b3621; border: none;">Save Changes</button>
    </form>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>