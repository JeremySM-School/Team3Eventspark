<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Profile | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg custom-navbar mb-4" style="background: var(--wood-dark);">
        <div class="container">
            <a class="navbar-brand fs-3 text-white fw-bold" href="/"><i class="bi bi-stars"></i> EventSpark</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#customerNav">
                <span class="navbar-toggler-icon" style="filter: invert(1);"></span>
            </button>
            <div class="collapse navbar-collapse" id="customerNav">
                <div class="navbar-nav ms-auto align-items-center">
                    <a class="nav-link text-light px-3" href="/customer/dashboard">Dashboard</a>
                    <a class="nav-link text-light px-3" href="/browse">Find Talent</a>
                    <a class="nav-link text-light px-3" href="/customer/inbox">Inbox</a>
                    <a class="nav-link text-light px-3" href="/customer/reviews">My Reviews</a>
                    <a class="nav-link text-warning fw-bold px-3" href="/logout">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container"><div class="row justify-content-center"><div class="col-md-8">
    <form action="/customer/profile/edit" method="POST">
        <div class="text-center mb-4">
            <img src="https://ui-avatars.com/api/?name=${(customer.firstName!'C')?url}+${(customer.lastName!'')?url}&background=0D8ABC&color=fff&size=150" class="rounded-circle shadow-sm border border-3 border-primary mb-3" style="width: 120px; height: 120px; object-fit: cover;">
            <br>
            <button type="button" class="btn btn-sm btn-outline-secondary fw-bold">Change Photo</button>
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
</div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>