<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Reviews | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg custom-navbar">
        <div class="container">
            <a class="navbar-brand fs-3" href="/">EventSpark</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="/customer/dashboard">Back to Dashboard</a>
            </div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold mb-0">Event Reviews</h2>
            <span class="badge bg-primary rounded-pill">${reviews?size} Total Reviews</span>
        </div>

        <div class="row g-4">
            <#list reviews as review>
                <div class="col-md-6">
                    <div class="card h-100 shadow-sm border-0">
                        <div class="card-body p-4">
                            <div class="d-flex align-items-center mb-3">
                                <div class="text-warning me-2">
                                    <#list 1..(review.starRating!0) as i>
                                        <i class="bi bi-star-fill"></i>
                                    </#list>
                                    <#if (review.starRating!0) < 5>
                                        <#list ((review.starRating!0) + 1)..5 as i>
                                            <i class="bi bi-star text-muted"></i>
                                        </#list>
                                    </#if>
                                </div>
                                <span class="fw-bold">${review.starRating!0}/5</span>
                            </div>
                            
                            <p class="card-text fs-5">"${review.comment!''}"</p>

                            <div class="mb-3 mt-2">
                                <span class="badge bg-light text-dark border me-2">
                                    <i class="bi bi-calendar-event me-1 text-primary"></i> ${(review.bookRequest.event.eventName)!'Event'}
                                </span>
                                <span class="badge bg-light text-dark border">
                                    <i class="bi bi-box-seam me-1 text-primary"></i> ${(review.bookRequest.servicePackages[0].title)!'Service'}
                                </span>
                            </div>
                            
                            <#if review.replyText??>
                                <div class="mt-3 p-3 bg-light rounded border-start border-4">
                                    <small class="fw-bold d-block mb-1">Provider Reply:</small>
                                    <p class="mb-0 small text-muted">${review.replyText}</p>
                                </div>
                            </#if>

                            <div class="mt-4 pt-3 border-top">
                                <small class="text-muted">
                                    <i class="bi bi-calendar3"></i> Posted: ${review.createdAt!""}
                                </small>
                            </div>
                        </div>
                    </div>
                </div>
            <#else>
                <div class="col-12 text-center py-5">
                    <i class="bi bi-chat-left-dots fs-1 text-muted d-block mb-3"></i>
                    <p class="text-muted">No reviews found in the database.</p>
                    <a href="/customer/dashboard" class="btn btn-primary mt-2">Find Services</a>
                </div>
            </#list>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>