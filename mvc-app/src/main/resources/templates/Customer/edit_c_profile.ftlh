<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Profile | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg custom-navbar">
        <div class="container">
            <a class="navbar-brand fs-3" href="../home/home.html">EventSpark</a>
            <div class="navbar-nav ms-auto"><a class="nav-link" href="c_dashboard.html">Back to Dashboard</a></div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="mb-4 fw-bold">Edit Profile</h2>
                <div class="card p-4">
                    <form action="c_dashboard.html">
                        <div class="text-center mb-4">
                            <div class="bg-secondary rounded-circle mx-auto mb-2" style="width: 100px; height: 100px;"></div>
                            <button class="btn btn-sm btn-outline-secondary">Change Photo</button>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input type="text" class="form-control" value="John Doe">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email Address</label>
                            <input type="email" class="form-control" value="name@example.com">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Phone Number</label>
                            <input type="tel" class="form-control" value="(555) 123-4567">
                        </div>
                        <hr>
                        <div class="mb-4">
                            <label class="form-label">Notification Preferences</label>
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" checked>
                                <label class="form-check-label">Email Notifications</label>
                            </div>
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox">
                                <label class="form-check-label">SMS Alerts</label>
                            </div>
                        </div>
                        <button class="btn btn-primary w-100">Save Changes</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>