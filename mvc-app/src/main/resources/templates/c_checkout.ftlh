<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout | EventSpark</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>

<nav class="navbar navbar-expand-lg custom-navbar mb-4" style="background: var(--wood-dark);">
        <div class="container">
            <a class="navbar-brand fs-3" href="/"><i class="bi bi-stars"></i> EventSpark</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link text-light" href="/browse">Back to Services</a>
            </div>
        </div>
    </nav>

<header>
    <h1>Checkout Page</h1>
</header>

<main class="checkout-container">
    <section class="payment">
        <h2>Booking & Payment Details</h2>
        
        <form action="/customer/checkout/process" method="POST">
            <input type="hidden" name="packageId" value="${pkg.id}">

            <h4 class="mt-4 mb-3" style="color: var(--wood-dark);">1. Event Details</h4>
            
            <#if existingEvents?? && existingEvents?has_content>
                <div class="mb-3 p-3 bg-light rounded border">
                    <label class="form-label fw-bold small text-primary">Add to an Existing Event</label>
                    <select name="existingEventId" class="form-select border-primary shadow-sm">
                        <option value="">-- No, I want to create a new event --</option>
                        <#list existingEvents as event>
                            <option value="${event.id}">${event.eventName}</option>
                        </#list>
                    </select>
                </div>
                <div class="text-center text-muted small fw-bold mb-3">OR CREATE NEW</div>
            </#if>

            <div class="form-group">
                <label>New Event Name <small class="text-muted fw-normal">(Leave blank if using existing)</small></label>
                <input type="text" name="eventName" placeholder="e.g. Sarah's Wedding">
            </div>
            <div class="form-group">
                <label>Event Date & Time</label>
                <input type="datetime-local" name="eventDate">
            </div>
            <div class="form-group">
                <label>Location</label>
                <input type="text" name="eventLocation" placeholder="City, State">
            </div>

            <hr class="my-4">

            <h4 class="mb-3" style="color: var(--wood-dark);">2. Payment Method</h4>
            <div class="form-group">
                <label for="cardholderName">Cardholder Name</label>
                <input type="text" id="cardholderName" name="cardholderName" required>
            </div>
            <div class="form-group">
                <label for="cardNumber">Card Number</label>
                <input type="text" id="cardNumber" name="cardNumber" placeholder="0000 0000 0000 0000" required>
            </div>
            <div class="row">
                <div class="col-6 form-group">
                    <label for="expiryDate">Expiry Date</label>
                    <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" required>
                </div>
                <div class="col-6 form-group">
                    <label for="cvv">CVV</label>
                    <input type="text" id="cvv" name="cvv" placeholder="123" required>
                </div>
            </div>

            <div class="d-flex gap-3 mt-4">
                <a href="/browse" class="btn btn-outline-secondary w-50 fw-bold">Cancel</a>
                <button type="submit" class="btn btn-primary w-50 fw-bold">Complete Request</button>
            </div>
        </form>
    </section>

    <aside class="order-summary">
        <h3>Order Summary</h3>

        <div class="order-item">
            <span><strong>Package:</strong></span>
            <span>${pkg.title}</span>
        </div>

        <div class="order-item">
            <span><strong>Description:</strong></span>
            <p>${pkg.description}</p>
        </div>

        <div class="order-item">
            <span><strong>Price:</strong></span>
            <span class="price-tag">$${pkg.price?string(",##0.00")}</span>
        </div>
    </aside>
</main>

</body>
</html>