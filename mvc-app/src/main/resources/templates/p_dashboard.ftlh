<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Provider Dashboard | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg custom-navbar">
        <div class="container">
            <a class="navbar-brand fs-3" href="../home/home.html"><i class="bi bi-stars"></i> EventSpark</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="navbar-nav ms-auto">
                    <a class="nav-link active" href="p_dashboard.html">Dashboard</a>
                    <a class="nav-link" href="p_inbox.html">Inbox <span class="badge bg-danger rounded-pill">1</span></a>
                    <a class="nav-link" href="p_profile.html">My Profile</a>
                    <a class="nav-link text-warning" href="../home/home.html">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="d-flex align-items-center justify-content-between mb-4">
            <h2 class="fw-bold">Welcome back, Khaled!</h2>
            <img src="https://upload.wikimedia.org/wikipedia/commons/8/89/DJ_KHALED_Press_exclusive_%283x4_cropped%29.jpg" class="rounded-circle shadow-sm border border-3 border-primary" style="width: 150px; height: 150px; object-fit: cover;">
        </div>
        
        <div class="row g-4 mb-5">
            <div class="col-md-4">
                <div class="card p-4 text-center border-start border-5 border-primary shadow-sm">
                    <h2 class="fw-bold text-primary">2</h2>
                    <p class="text-muted mb-0 fw-bold text-uppercase small">Upcoming Gigs</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-4 text-center border-start border-5 border-success shadow-sm">
                    <h2 class="fw-bold text-success">$75,000</h2>
                    <p class="text-muted mb-0 fw-bold text-uppercase small">Month Revenue</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-4 text-center border-start border-5 border-warning shadow-sm">
                    <h2 class="fw-bold text-warning">5.0 <i class="bi bi-star-fill fs-5"></i></h2>
                    <p class="text-muted mb-0 fw-bold text-uppercase small">Average Rating</p>
                </div>
            </div>
        </div>

        <div class="row g-4">
            <div class="col-md-8">
                <div class="card h-100 shadow-sm border-0">
                    <div class="card-header bg-white fw-bold py-3 fs-5">Studio Management</div>
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-6">
                                <a href="packages.html" class="btn btn-outline-primary w-100 py-4 fw-bold">
                                    <i class="bi bi-box-seam fs-3 d-block mb-2"></i>Packages
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="calendar.html" class="btn btn-outline-primary w-100 py-4 fw-bold">
                                    <i class="bi bi-calendar-check fs-3 d-block mb-2"></i>Calendar
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="edit_p_profile.html" class="btn btn-outline-primary w-100 py-4 fw-bold">
                                    <i class="bi bi-person-gear fs-3 d-block mb-2"></i>Edit Profile
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="p_reviews.html" class="btn btn-outline-primary w-100 py-4 fw-bold">
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
                        <li class="list-group-item py-3">
                            <div class="d-flex justify-content-between mb-1">
                                <strong class="small text-primary">New Request</strong>
                                <span class="badge bg-warning text-dark">Pending</span>
                            </div>
                            <p class="small text-muted mb-0">Sarah wants to book "Another One Wedding Set"</p>
                        </li>
                        <li class="list-group-item py-3">
                            <div class="d-flex justify-content-between mb-1">
                                <strong class="small text-success">New Review</strong>
                                <span class="text-warning">★★★★★</span>
                            </div>
                            <p class="small text-muted mb-0">Drake left a 5-star review.</p>
                        </li>
                    </ul>
                    <div class="card-body text-center mt-auto">
                        <a href="p_inbox.html" class="btn btn-sm btn-outline-secondary w-100 fw-bold">View All Activity</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>