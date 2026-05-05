<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Provider Dashboard | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/styles.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg custom-navbar mb-4" style="background: var(--wood-dark);">
        <div class="container">
            <a class="navbar-brand fs-3 text-white fw-bold" href="/"><i class="bi bi-stars"></i> EventSpark</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#providerNav">
                <span class="navbar-toggler-icon" style="filter: invert(1);"></span>
            </button>
            <div class="collapse navbar-collapse" id="providerNav">
                <div class="navbar-nav ms-auto align-items-center">
                    <a class="nav-link text-light px-3" href="/provider/dashboard">Dashboard</a>
                    <a class="nav-link text-light px-3" href="/provider/messages">
                        Messages 
                        <#if pendingCount?? && pendingCount &gt; 0>
                            <span class="badge bg-danger rounded-pill ms-1">${pendingCount}</span>
                        </#if>
                    </a>
                    <a class="nav-link text-light px-3" href="/provider/history">History</a>
                    <a class="nav-link text-light px-3" href="/provider/profile">Public Page</a>
                    <a class="nav-link text-warning fw-bold px-3" href="/logout">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="d-flex align-items-center justify-content-between mb-4">
            <h2 class="fw-bold">Welcome back, ${(provider.name)!'Provider'}!</h2>
            
            <img src="${(provider.imageUrls[0])!'https://ui-avatars.com/api/?name=${(provider.name!\'P\')?url}&background=4e342e&color=fff&size=150'}" class="rounded-circle shadow-sm border border-3 border-primary" style="width: 150px; height: 150px; object-fit: cover;">
        </div>
        
        <div class="row g-4 mb-5">
            <div class="col-md-4">
                <div class="card p-4 text-center border-start border-5 border-primary shadow-sm">
                    <h2 class="fw-bold text-primary">${upcomingGigs}</h2>
                    <p class="text-muted mb-0 fw-bold text-uppercase small">Upcoming Gigs</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-4 text-center border-start border-5 border-success shadow-sm">
                    <h2 class="fw-bold text-success">$${totalRevenue}</h2>
                    <p class="text-muted mb-0 fw-bold text-uppercase small">Month Revenue</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-4 text-center border-start border-5 border-warning shadow-sm">
                    <h2 class="fw-bold text-warning">${avgRating!5.0} <i class="bi bi-star-fill fs-5"></i></h2>                    
                    <p class="text-muted mb-0 fw-bold text-uppercase small">Average Rating</p>
                </div>
            </div>
        </div>

        <div class="row g-4">
            <div class="col-md-8">
                <div class="card h-100 shadow-sm border-0">
                    <div class="card-header bg-white fw-bold py-3 fs-5">Provider Management</div>
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-6">
                                <a href="/provider/packages" class="btn btn-outline-primary w-100 py-4 fw-bold">
                                    <i class="bi bi-box-seam fs-3 d-block mb-2"></i>Packages
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="/provider/calendar" class="btn btn-outline-primary w-100 py-4 fw-bold">
                                    <i class="bi bi-calendar-check fs-3 d-block mb-2"></i>Calendar
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="/provider/profile/edit" class="btn btn-outline-primary w-100 py-4 fw-bold">
                                    <i class="bi bi-person-gear fs-3 d-block mb-2"></i>Edit Profile
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="/provider/reviews" class="btn btn-outline-primary w-100 py-4 fw-bold">
                                    <i class="bi bi-chat-quote fs-3 d-block mb-2"></i>Fan Love
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card h-100 shadow-sm border-0">
                    <div class="card-header bg-white fw-bold py-3 fs-5">Recent Activity</div>
                    <ul class="list-group list-group-flush">
                        <#if recentActivity?? && recentActivity?has_content>
                            <#list recentActivity as req>
                                <li class="list-group-item py-3">
                                    <div class="d-flex justify-content-between mb-1">
                                        <strong class="small text-primary"><i class="bi bi-calendar-event me-1"></i> ${(req.event.eventName)!'Unnamed Event'}</strong>                                        <span class="badge bg-${(req.status == 'PENDING')?string('warning', (req.status == 'APPROVED')?string('success', 'secondary'))} text-dark">${req.status}</span>
                                    </div>
                                    <p class="small text-muted mb-0">${(req.event.customer.firstName)!'Customer'} wants to book "${req.servicePackages[0].title}"</p>
                                </li>
                            </#list>
                        <#else>
                            <li class="list-group-item py-4 text-center text-muted small">No recent activity found.</li>
                        </#if>
                    </ul>
                    <div class="card-body text-center mt-auto">
                        <a href="/provider/history" class="btn btn-sm btn-outline-secondary w-100 fw-bold">View All Activity</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>