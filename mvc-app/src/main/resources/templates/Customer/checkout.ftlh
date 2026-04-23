<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg custom-navbar">
        <div class="container">
            <a class="navbar-brand fs-3" href="../home/home.html">EventSpark</a>
        </div>
    </nav>

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow p-4">
                    <h3 class="mb-4 fw-bold">Payment Details</h3>
                    <div class="alert alert-info small">
                        <i class="bi bi-info-circle-fill"></i> You will only be charged if the provider accepts your request.
                    </div>
                    
                    <form action="c_bookings.html">
                        <div class="mb-3">
                            <label class="form-label">Name on Card</label>
                            <input type="text" class="form-control" placeholder="John Doe">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Card Number</label>
                            <input type="text" class="form-control" placeholder="0000 0000 0000 0000">
                        </div>
                        <div class="row mb-4">
                            <div class="col-6">
                                <label class="form-label">Expiry</label>
                                <input type="text" class="form-control" placeholder="MM/YY">
                            </div>
                            <div class="col-6">
                                <label class="form-label">CVV</label>
                                <input type="text" class="form-control" placeholder="123">
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success w-100 py-3 fw-bold">Confirm Booking Request</button>
                        <a href="booking_form.html" class="btn btn-link w-100 mt-2 text-muted">Cancel</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>