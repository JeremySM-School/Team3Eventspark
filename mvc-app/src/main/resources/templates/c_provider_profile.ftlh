<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${provider.name}'s Profile | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/styles.css">
</head>
<body>

    <nav class="navbar navbar-expand-lg custom-navbar mb-4" style="background: var(--wood-dark);">
        <div class="container">
            <a class="navbar-brand fs-3 text-white fw-bold" href="/"><i class="bi bi-stars"></i> EventSpark</a>
            <div class="navbar-nav ms-auto align-items-center">
                <a class="nav-link text-light px-3" href="/browse">Back to Search</a>
                <a class="nav-link text-light px-3" href="/customer/dashboard">My Dashboard</a>
            </div>
        </div>
    </nav>

    <div class="container py-4">
        <div class="card shadow-sm border-0 mb-4 overflow-hidden">
            <div class="bg-primary" style="height: 120px; background: linear-gradient(to right, var(--wood-dark), var(--wood-light));"></div>
            <div class="card-body px-5 pb-5 position-relative">
                <img src="https://ui-avatars.com/api/?name=${(provider.name!'P')?url}&background=4e342e&color=fff&size=150" 
                     class="rounded-circle shadow border border-4 border-white position-absolute" 
                     style="width: 120px; height: 120px; top: -60px; object-fit: cover;">
                
                <div class="mt-5 pt-3">
                    <div class="d-flex justify-content-between align-items-start">
                        <div>
                            <h2 class="fw-bold mb-1">${provider.name}</h2>
                                <p class="text-muted mb-2">
                                    <i class="bi bi-geo-alt-fill me-1 text-primary"></i> 
                                    <#if provider.zipCode?? && provider.serviceRadius??>
                                        Serving within ${provider.serviceRadius} miles of ${provider.zipCode}
                                    <#else>
                                        Serving Local Area
                                    </#if>
                                    • ${(provider.category)!'Event Professional'}
                                </p>                            
                                <p class="mb-0 fs-5 text-warning fw-bold">${(provider.rating)!5.0} <i class="bi bi-star-fill"></i></p>
                        </div>
                    </div>
                    <hr class="my-4">
                    <h5 class="fw-bold">About Me</h5>
                    <p class="text-muted">${(provider.bio)!'This provider hasn\'t written a bio yet, but their services speak for themselves!'}</p>
                </div>
            </div>
        </div>

        <div class="row g-4">
            <div class="col-md-7">
                <h4 class="fw-bold mb-3" style="color: var(--wood-dark);">Service Packages</h4>
                <#if packages?? && packages?has_content>
                    <#list packages as pkg>
                        <div class="card shadow-sm border-0 mb-3 border-start border-4 border-primary">
                            <div class="card-body p-4">
                                <div class="d-flex justify-content-between align-items-start mb-2">
                                    <h5 class="fw-bold mb-0">${pkg.title}</h5>
                                    <h4 class="text-success fw-bold mb-0">$${pkg.price?string(",##0.00")}</h4>
                                </div>
                                <span class="badge bg-light text-primary border mb-3">${pkg.category!"SERVICE"}</span>
                                <p class="text-muted mb-4">${pkg.description}</p>
                                
                                <a href="/customer/checkout?packageId=${pkg.id}" class="btn btn-primary fw-bold w-100 py-2">
                                    <i class="bi bi-calendar-check me-2"></i>Book This Package
                                </a>
                            </div>
                        </div>
                    </#list>
                <#else>
                    <div class="alert alert-light border text-center text-muted p-4">
                        This provider doesn't have any active packages right now.
                    </div>
                </#if>
            </div>

            <div class="col-md-5">
                <h4 class="fw-bold mb-3" style="color: var(--wood-dark);">Reviews & Fan Love</h4>
                <#if reviews?? && reviews?has_content>
                    <#list reviews as review>
                        <div class="card shadow-sm border-0 mb-3">
                            <div class="card-body">
                                <div class="d-flex justify-content-between mb-2">
                                    <strong class="text-dark">${(review.customer.fullName)!'Guest'}</strong>
                                    <span class="text-warning fw-bold">${review.starRating}/5 <i class="bi bi-star-fill"></i></span>
                                </div>
                                <p class="text-muted small mb-0">"${review.comment}"</p>
                                
                                <#if review.replyText??>
                                    <div class="mt-3 p-2 bg-light border-start border-3 border-secondary rounded">
                                        <small class="fw-bold text-muted d-block mb-1">Provider Response:</small>
                                        <small class="text-muted">"${review.replyText}"</small>
                                    </div>
                                </#if>
                            </div>
                        </div>
                    </#list>
                <#else>
                    <div class="card shadow-sm border-0 bg-light">
                        <div class="card-body text-center p-5 text-muted">
                            <i class="bi bi-chat-quote display-4 opacity-25 d-block mb-3"></i>
                            No reviews yet. Be the first to book them!
                        </div>
                    </div>
                </#if>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>