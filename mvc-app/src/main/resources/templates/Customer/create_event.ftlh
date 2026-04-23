<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Plan New Event | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg custom-navbar">
        <div class="container">
            <a class="navbar-brand fs-3" href="../home/home.html">EventSpark</a>
            <div class="navbar-nav ms-auto"><a class="nav-link" href="c_dashboard.html">Cancel</a></div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <h2 class="mb-4 fw-bold">Plan a New Event</h2>
                <div class="card p-4">
                    <form action="../home/browse_service.html">
                        <div class="mb-3">
                            <label class="form-label">Event Name</label>
                            <input type="text" class="form-control" placeholder="e.g. Smith Wedding 2026">
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="form-label">Date</label>
                                <input type="date" class="form-control">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Location</label>
                                <input type="text" class="form-control" placeholder="City, State">
                            </div>
                        </div>
                        <div class="mb-4">
                            <label class="form-label">What services do you need?</label>
                            <div class="form-check"><input class="form-check-input" type="checkbox" checked> <label>DJ / Music</label></div>
                            <div class="form-check"><input class="form-check-input" type="checkbox"> <label>Photographer</label></div>
                            <div class="form-check"><input class="form-check-input" type="checkbox"> <label>Catering</label></div>
                        </div>
                        <button type="submit" class="btn btn-primary btn-lg w-100">Find Providers</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>