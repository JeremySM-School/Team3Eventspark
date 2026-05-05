<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/styles.css">
</head>
<body>

<nav class="navbar navbar-expand-lg custom-navbar mb-4" style="background: var(--wood-dark);">
        <div class="container">
            <a class="navbar-brand fs-3 text-white fw-bold" href="/"><i class="bi bi-stars"></i> EventSpark</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#customerNav">
                <span class="navbar-toggler-icon" style="filter: invert(1);"></span>
            </button>
            <div class="collapse navbar-collapse" id="customerNav">
                <div class="navbar-nav ms-auto align-items-center">
                    <a class="nav-link text-light px-3" href="/customer/dashboard">Dashboard</a>
                    <a class="nav-link text-light px-3" href="/browse">Find Talent</a>
                    <a class="nav-link text-light px-3" href="/customer/inbox">Inbox</a>
                    <a class="nav-link text-light px-3" href="/customer/reviews">My Reviews</a>
                    <a class="nav-link text-warning fw-bold px-3" href="/logout">Logout</a>
                </div>
            </div>
        </div>
</nav>

<div class="container py-4">
        <h2 class="fw-bold mb-4" style="color: var(--wood-dark);">Secure Checkout</h2>

        <div class="row g-4">
            <div class="col-md-8">
                <div class="card shadow-sm border-0">
                    <div class="card-body p-4">
                        <form action="/customer/checkout/process" method="POST">
                            <input type="hidden" name="packageId" value="${pkg.id}">

                            <h4 class="mb-4 fw-bold text-primary"><i class="bi bi-calendar-event me-2"></i>1. Event Details</h4>
                            
                            <#if existingEvents?? && existingEvents?has_content>
                                <div class="mb-3 p-3 bg-light rounded border border-primary shadow-sm">
                                    <label class="form-label fw-bold small text-primary">Add to an Existing Event</label>
                                    <select name="existingEventId" class="form-select border-primary">
                                        <option value="">-- No, I want to create a new event --</option>
                                        <#list existingEvents as event>
                                            <option value="${event.id}">${event.eventName}</option>
                                        </#list>
                                    </select>
                                </div>
                                <div class="text-center text-muted small fw-bold mb-3">OR CREATE NEW</div>
                            </#if>

                            <div class="row g-3 mb-4">
                                <div class="col-md-12">
                                    <label class="form-label fw-bold small">New Event Name <span class="text-muted fw-normal">(Leave blank if using existing)</span></label>
                                    <input type="text" name="eventName" class="form-control" placeholder="e.g. Sarah's Wedding">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold small">Event Date & Time</label>
                                    <input type="datetime-local" name="eventDate" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold small">Location</label>
                                    <input type="text" name="eventLocation" class="form-control" placeholder="City, State">
                                </div>
                            </div>

                            <hr class="my-5">

                            <h4 class="mb-4 fw-bold text-primary"><i class="bi bi-credit-card me-2"></i>2. Payment Method</h4>
                            
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="cardholderName" class="form-label fw-bold small">Cardholder Name</label>
                                    <input type="text" id="cardholderName" name="cardholderName" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="cardNumber" class="form-label fw-bold small">Card Number</label>
                                    <input type="text" id="cardNumber" name="cardNumber" class="form-control" placeholder="0000 0000 0000 0000" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="expiryDate" class="form-label fw-bold small">Expiry Date</label>
                                    <input type="text" id="expiryDate" name="expiryDate" class="form-control" placeholder="MM/YY" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="cvv" class="form-label fw-bold small">CVV</label>
                                    <input type="text" id="cvv" name="cvv" class="form-control" placeholder="123" required>
                                </div>
                            </div>

                            <div class="d-flex gap-3 mt-5">
                                <a href="/browse" class="btn btn-outline-secondary w-50 fw-bold py-3">Cancel</a>
                                <button type="submit" class="btn btn-primary w-50 fw-bold py-3">Complete Request</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card shadow-sm border-0 sticky-top" style="top: 20px;">
                    <div class="card-header bg-primary text-white fw-bold py-3 text-center">
                        Order Summary
                    </div>
                    <div class="card-body p-4">
                        <h5 class="fw-bold mb-2">${pkg.title}</h5>
                        <p class="text-muted small mb-4">${pkg.description}</p>
                        
                        <hr>
                        
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <span class="text-muted fw-bold">Subtotal</span>
                            <span class="fw-bold">$${pkg.price?string(",##0.00")}</span>
                        </div>
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <span class="text-muted fw-bold">Service Fee</span>
                            <span class="fw-bold">$0.00</span>
                        </div>
                        
                        <div class="p-3 bg-light rounded border border-success">
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="fs-5 fw-bold text-success">Total</span>
                                <span class="fs-4 fw-bold text-success">$${pkg.price?string(",##0.00")}</span>
                            </div>
                        </div>
                        
                        <div class="text-center mt-4">
                            <small class="text-muted"><i class="bi bi-lock-fill me-1"></i> Payments are secure and encrypted</small>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>