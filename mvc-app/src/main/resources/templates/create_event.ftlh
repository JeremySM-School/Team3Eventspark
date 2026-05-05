<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Plan New Event | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles.css">
</head>

<body>
    <nav class="navbar navbar-expand-lg custom-navbar">
        <div class="container">
            <a class="navbar-brand fs-3" href="/">EventSpark</a>
            <div class="navbar-nav ms-auto"><a class="nav-link" href="/customer/dashboard">Cancel</a></div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <h2 class="mb-4 fw-bold">Plan a New Event</h2>
                <div class="card p-4">
                    <form action="/customer/events/new" method="post">
                        <div class="row mb-3">
                            <div class="col-md-8">
                                <label class="form-label fw-bold small">Event Name</label>
                                <input type="text" name="eventName" class="form-control" placeholder="e.g. Sarah's 30th Birthday" required>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label fw-bold small">Event Type</label>
                                <select name="eventType" class="form-select border-primary">
                                    <option value="Wedding">Wedding</option>
                                    <option value="Corporate">Corporate</option>
                                    <option value="Party">Private Party</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="form-label fw-bold small">Date and Time</label>
                                <input type="datetime-local" name="eventDate" class="form-control" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold small">Venue Location</label>
                                <input type="text" name="eventLocation" class="form-control" placeholder="City, State or Venue Name" required>
                            </div>
                        </div>

                        <div class="mb-4 bg-light p-3 rounded border">
                            <label class="form-label fw-bold text-primary mb-3"><i class="bi bi-card-checklist me-2"></i>Anticipated Services Needed</label>
                            <div class="row g-2">
                                <div class="col-md-4"><div class="form-check"><input class="form-check-input" type="checkbox" value="DJ"> <label>DJ / Music</label></div></div>
                                <div class="col-md-4"><div class="form-check"><input class="form-check-input" type="checkbox" value="Photo"> <label>Photography</label></div></div>
                                <div class="col-md-4"><div class="form-check"><input class="form-check-input" type="checkbox" value="Catering"> <label>Catering</label></div></div>
                                <div class="col-md-4"><div class="form-check"><input class="form-check-input" type="checkbox" value="Venue"> <label>Venue Rental</label></div></div>
                                <div class="col-md-4"><div class="form-check"><input class="form-check-input" type="checkbox" value="Decor"> <label>Decorations</label></div></div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary btn-lg w-100 fw-bold">Create Event Portfolio</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>