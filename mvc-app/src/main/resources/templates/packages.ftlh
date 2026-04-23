<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Packages | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg custom-navbar">
        <div class="container">
            <a class="navbar-brand fs-3" href="../home/home.html"><i class="bi bi-stars"></i> EventSpark</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="p_dashboard.html">Back to Dashboard</a>
            </div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold">My Service Packages</h2>
            <button class="btn btn-primary fw-bold"><i class="bi bi-plus-lg me-1"></i> Add New Package</button>
        </div>

        <div class="card mb-3 border-start border-4 border-warning shadow-sm">
            <div class="card-body d-flex justify-content-between align-items-center">
                <div>
                    <h5 class="fw-bold mb-1">"Another One" Wedding Set</h5>
                    <p class="text-muted mb-1 small">4 Hours • Full PA System • Motivational Speeches</p>
                    <span class="badge bg-light text-dark border">Wedding</span>
                </div>
                <div class="text-end">
                    <h3 class="text-success fw-bold mb-1">$50,000</h3>
                    <div>
                        <button class="btn btn-sm btn-outline-secondary me-1">Edit</button>
                        <button class="btn btn-sm btn-outline-danger">Delete</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="card mb-3 shadow-sm">
            <div class="card-body d-flex justify-content-between align-items-center">
                <div>
                    <h5 class="fw-bold mb-1">Standard Club Mix</h5>
                    <p class="text-muted mb-1 small">2 Hours • Mixing Only</p>
                    <span class="badge bg-light text-dark border">Party</span>
                </div>
                <div class="text-end">
                    <h3 class="text-success fw-bold mb-1">$25,000</h3>
                    <div>
                        <button class="btn btn-sm btn-outline-secondary me-1">Edit</button>
                        <button class="btn btn-sm btn-outline-danger">Delete</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>