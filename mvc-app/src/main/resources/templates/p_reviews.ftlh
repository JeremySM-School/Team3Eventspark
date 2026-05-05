<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Reviews | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/styles.css">
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg custom-navbar mb-4" style="background: var(--wood-dark);">
        <div class="container">
            <a class="navbar-brand fs-3" href="/"><i class="bi bi-stars"></i> EventSpark</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link text-light" href="/provider/dashboard">Back to Dashboard</a>
            </div>
        </div>
    </nav>

    <div class="container py-5">
        <h2 class="mb-4 fw-bold" style="color: var(--wood-dark);">Fan Love (Customer Reviews)</h2>
        
        <#if reviews?? && reviews?has_content>
            <#list reviews as review>
            <div class="card mb-4 shadow-sm border-0 border-start border-4 border-warning">
                <div class="card-body">
                    <div class="d-flex justify-content-between">
                        <h5 class="fw-bold">${(review.customer.firstName)!'Customer'} <span class="text-warning ms-2">${review.starRating}/5 ★</span></h5>
                        <small class="text-muted">${review.createdAt!''}</small>
                    </div>
                    <p class="mb-3">"${review.comment!''}"</p>
                    
                    <#if review.replyText??>
                        <div class="ms-4 mt-3 ps-3 border-start border-4 border-primary bg-light p-2 rounded">
                            <small class="fw-bold text-primary">You replied:</small>
                            <p class="small text-muted mb-0">"${review.replyText}"</p>
                        </div>
                    <#else>
                        <div class="bg-light p-3 rounded border mt-3">
                            <label class="small fw-bold mb-2">Reply to customer:</label>
                            <form action="/provider/reviews/reply" method="POST">
                                <input type="hidden" name="reviewId" value="${review.id}">
                                <div class="input-group">
                                    <input type="text" name="replyText" class="form-control" placeholder="Write a professional response..." required>
                                    <button type="submit" class="btn btn-primary fw-bold">Post Reply</button>
                                </div>
                            </form>
                        </div>
                    </#if>
                </div>
            </div>
            </#list>
        <#else>
            <div class="alert alert-light border text-center py-5 shadow-sm">
                <i class="bi bi-star-half display-4 text-muted d-block mb-3 opacity-50"></i>
                <h5 class="text-muted">No reviews yet.</h5>
                <p class="text-muted small">When customers leave feedback, it will appear here!</p>
            </div>
        </#if>
    </div>
</body>
</html>