<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Request Booking | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg custom-navbar">
        <div class="container">
            <a class="navbar-brand fs-3" href="/">EventSpark</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="/services/browse">Cancel</a>
            </div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-header bg-white fw-bold py-3">Booking Request: ${providerName!"Provider"}</div>
                    <div class="card-body p-4">
                        <form action="/bookings/create" method="POST">
                            <input type="hidden" name="customerId" value="${customerId}">
                            
                            <h5 class="mb-3">Event Details</h5>
                            <div class="mb-3">
                                <label class="form-label">Select Package</label>
                                <select class="form-select" name="packageId">
                                    <#if packages?has_content>
                                        <#list packages as pkg>
                                            <option value="${pkg.id}">${pkg.packageName} ($${pkg.price})</option>
                                        </#list>
                                    <#else>
                                        <option disabled>No packages available</option>
                                    </#if>
                                </select>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label class="form-label">Date</label>
                                    <input type="date" name="eventDate" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Time</label>
                                    <input type="time" name="eventTime" class="form-control" required>
                                </div>
                            </div>
                            <div class="mb-4">
                                <label class="form-label">Message for Provider (Optional)</label>
                                <textarea name="message" class="form-control" rows="3" placeholder="Tell us about your venue..."></textarea>
                            </div>
                            
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="fw-bold fs-5">Total: <span class="text-success">Calculated at Checkout</span></span>
                                <button type="submit" class="btn btn-primary btn-lg">Proceed to Checkout</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>