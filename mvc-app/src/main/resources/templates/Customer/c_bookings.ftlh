<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> My Bookings | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
   <nav class="navbar navbar-expand-lg custom-navbar">
        <div class="container">
            <a class="navbar-brand fs-3" href="/">EventSpark</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="/customers/dashboard/${customerId}">Back to Dashboard</a>
            </div>
        </div>
    </nav>

    <div class="container py-5">
        <h2 class="mb-4 fw-bold">My Event Bookings</h2>
        
        <#if bookings?? && bookings?size gt 0>
            <#list bookings as booking>
                <div class="card mb-3 border-start border-4 
                    <#if booking.status == 'CONFIRMED'>border-success
                    <#elseif booking.status == 'PENDING'>border-warning
                    <#else>border-secondary</#if> 
                    <#if booking.status == 'COMPLETED'>bg-light opacity-75</#if>">
                    
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-md-2 text-center">
                                <h3 class="mb-0 fw-bold">${booking.eventDate.dayOfMonth}</h3>
                                <small class="text-uppercase fw-bold text-muted">${booking.eventDate.month}</small>
                            </div>
                            <div class="col-md-6">
                                <h5 class="fw-bold mb-1">${booking.eventName!"Untitled Event"}</h5>
                                <p class="text-muted mb-0">
                                    <i class="bi bi-person-check"></i> 
                                    ${booking.providerName!"Provider"} • ${booking.packageName!"Standard Package"}
                                </p>
                            </div>
                            <div class="col-md-4 text-end">
                                <#if booking.status == 'CONFIRMED'>
                                    <span class="badge bg-success mb-2">Confirmed</span><br>
                                    <a href="/messages/inbox/${customerId}" class="btn btn-sm btn-outline-primary">Message</a>
                                    <button class="btn btn-sm btn-outline-danger" disabled>Cancel</button>
                                
                                <#elseif booking.status == 'PENDING'>
                                    <span class="badge bg-warning text-dark mb-2">Pending Approval</span><br>
                                    <a href="/bookings/cancel/${booking.id}/${customerId}" class="btn btn-sm btn-outline-danger">Cancel Request</a>
                                
                                <#elseif booking.status == 'COMPLETED'>
                                    <span class="badge bg-secondary mb-2">Completed</span><br>
                                    <a href="/reviews/new/${booking.id}" class="btn btn-sm btn-warning">Write Review</a>
                                </#if>
                            </div>
                        </div>
                    </div>
                </div>
            </#list>
        <#else>
            <div class="text-center py-5">
                <p class="text-muted">You have no bookings yet.</p>
                <a href="/services/browse" class="btn btn-primary">Browse Services</a>
            </div>
        </#if>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>