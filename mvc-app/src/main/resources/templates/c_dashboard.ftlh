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
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="navbar-nav ms-auto">
                    <a class="nav-link active" href="/customer/dashboard">Dashboard</a>
                    <a class="nav-link" href="/customer/inbox">Inbox</a>
                    <a class="nav-link" href="/customer/reviews">My Reviews</a>
                    <a class="nav-link text-warning" href="/logout">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="mb-0 fw-bold">Welcome back, ${customer.firstName!"Guest"}!</h2>
            <a href="/customer/events/new" class="btn btn-primary"><i class="bi bi-plus-lg"></i> Plan New Event</a>
        </div>

        <div class="row g-4 mb-5">
            <div class="col-md-4">
                <div class="card p-4 text-center border-start border-5 border-primary">
                    <h2 class="fw-bold text-primary">${(upcomingEventsCount)!0}</h2>
                    <p class="text-muted mb-0">Upcoming Events</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-4 text-center border-start border-5 border-warning">
                    <h2 class="fw-bold text-warning">${(pendingRequestsCount)!0}</h2>
                    <p class="text-muted mb-0">Pending Requests</p>
                </div>
            </div>
            <div class="col-md-4">
                <<div class="card p-4 text-center border-start border-5 border-success shadow-sm">
                    <h2 class="fw-bold text-success">$${totalSpent!0}</h2>
                    <p class="text-muted mb-0 fw-bold text-uppercase small">Total Spent</p>
                </div>
            </div>
        </div>

        <div class="row g-4">
            <div class="col-md-6">
                <div class="card h-100 shadow-sm">
                    <div class="card-header fw-bold bg-white py-3">Quick Actions</div>
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-6">
                                <a href="/browse" class="btn btn-outline-primary w-100 py-3">
                                    <i class="bi bi-search fs-4 d-block mb-2"></i>Find Talent
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="/customer/reviews" class="btn btn-outline-primary w-100 py-3">
                                    <i class="bi bi-star-fill fs-4 d-block mb-2"></i>My Reviews
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="/customer/profile/edit" class="btn btn-outline-primary w-100 py-3">
                                    <i class="bi bi-person-gear fs-4 d-block mb-2"></i>Edit Profile
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="/customer/inbox" class="btn btn-outline-primary w-100 py-3">
                                    <i class="bi bi-envelope fs-4 d-block mb-2"></i>Messages
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card h-100 shadow-sm">
                    <div class="card-header bg-white fw-bold py-3">My Events</div>
                    <ul class="list-group list-group-flush" style="max-height: 300px; overflow-y: auto;">
                        <#if customer.events?? && customer.events?has_content>
                            <#list customer.events as event>
                                <li class="list-group-item py-3">
                                    <div class="d-flex justify-content-between mb-2">
                                        <strong class="text-primary">${event.eventName}</strong>
                                        <span class="badge bg-light text-dark border">${event.status!"Planning"}</span>
                                    </div>
                                    <small class="text-muted d-block mb-2"><i class="bi bi-calendar"></i> ${(event.eventDate?replace('T', ' at '))!'Date TBD'}</small>
                                    
                                    <#if event.bookRequests?? && event.bookRequests?has_content>
                                        <#list event.bookRequests as booking>
                                            <#if booking.status == 'APPROVED'>
                                                <form action="/customer/reviews/add" method="POST" class="bg-light p-2 rounded border mt-2">
                                                    <input type="hidden" name="bookingId" value="${booking.id}">
                                                    <div class="input-group input-group-sm">
                                                        <select name="starRating" class="form-select border-warning" style="max-width: 80px;" required>
                                                            <option value="5">5 ★</option>
                                                            <option value="4">4 ★</option>
                                                            <option value="3">3 ★</option>
                                                            <option value="2">2 ★</option>
                                                            <option value="1">1 ★</option>
                                                        </select>
                                                        <input type="text" name="comment" class="form-control" placeholder="Review ${booking.provider.name}..." required>
                                                        <button type="submit" class="btn btn-outline-primary fw-bold">Post</button>
                                                    </div>
                                                </form>
                                            </#if>
                                        </#list>
                                    </#if>
                                </li>
                            </#list>
                        <#else>
                            <li class="list-group-item text-center py-4 text-muted">No events planned yet.</li>
                        </#if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>