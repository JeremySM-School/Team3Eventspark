<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Write Review | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg custom-navbar">
        <div class="container">
            <a class="navbar-brand fs-3" href="/">EventSpark</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="/bookings/customer/${customerId}">Cancel</a>
            </div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="card mx-auto shadow-sm" style="max-width: 600px;">
            <div class="card-header bg-white text-center py-4">
                <h3 class="fw-bold">Rate Your Experience</h3>
                <p class="text-muted mb-0">How was ${providerName!"the provider"}?</p>
            </div>
            <div class="card-body p-4">
                <form action="/reviews/create" method="POST">
                    <input type="hidden" name="customerId" value="${customerId}">
                    <input type="hidden" name="providerId" value="${providerId}">

                    <div class="text-center mb-4">
                        <div class="mb-3">
                            <label class="form-label d-block fw-bold">Star Rating</label>
                            <input type="number" name="rating" min="1" max="5" class="form-control mx-auto" style="width: 80px;" required>
                            <small class="text-muted">Enter 1 to 5 stars</small>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Write a Review</label>
                        <textarea name="comment" class="form-control" rows="5" placeholder="What did you like? What could be improved?" required></textarea>
                    </div>

                    <button type="submit" class="btn btn-primary w-100 py-2">Submit Review</button>
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>