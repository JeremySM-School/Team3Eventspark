<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg custom-navbar">
        <div class="container">
            <a class="navbar-brand" href="/">
                <i class="bi bi-stars"></i> EventSpark
            </a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="navbar-nav ms-auto">
                    <a class="nav-link active" href="/customers/dashboard/${customer.id}">Dashboard</a>
                    <a class="nav-link" href="/events/customer/${customer.id}">My Events</a>
                    <a class="nav-link" href="/bookings/customer/${customer.id}">My Bookings</a>
                    <a class="nav-link text-warning" href="/logout">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="mb-0 fw-bold">Welcome back, ${customer.name}!</h2>
            <a href="/events/new/${customer.id}" class="btn btn-primary"><i class="bi bi-plus-lg"></i> Plan New Event</a>
        </div>

        <div class="row g-4 mb-5">
            <div class="col-md-4">
                <div class="card p-4 text-center border-start border-5 border-primary">
                    <h2 class="fw-bold text-primary">3</h2> <p class="text-muted mb-0">Upcoming Events</p>
                </div>
            </div>
            </div>

        <div class="row g-4">
            <div class="col-md-6">
                <div class="card h-100 shadow-sm">
                    <div class="card-header fw-bold bg-white py-3">Quick Actions</div>
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-6"><a href="/services/browse" class="btn btn-outline-primary w-100 py-3"><i class="bi bi-search fs-4 d-block mb-2"></i>Find Talent</a></div>
                            <div class="col-6"><a href="/bookings/customer/${customer.id}" class="btn btn-outline-primary w-100 py-3"><i class="bi bi-calendar-event fs-4 d-block mb-2"></i>Manage Bookings</a></div>
                            <div class="col-6"><a href="/customers/edit/${customer.id}" class="btn btn-outline-primary w-100 py-3"><i class="bi bi-person-gear fs-4 d-block mb-2"></i>Edit Profile</a></div>
                            <div class="col-6"><a href="/messages/inbox/${customer.id}" class="btn btn-outline-primary w-100 py-3"><i class="bi bi-envelope fs-4 d-block mb-2"></i>Messages</a></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card h-100 shadow-sm">
                    <div class="card-header bg-white fw-bold py-3">Account Details</div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <strong class="text-primary small">Email Address</strong>
                            <p class="small text-muted mb-0">${customer.email}</p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>