<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Saved Favorites | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
    <div class="container py-5">
        <h2 class="fw-bold mb-4" style="color: var(--wood-dark);"><i class="bi bi-heart-fill text-danger me-2"></i>My Saved Services</h2>
        
        <div class="row g-4">
            <#if favorites?? && favorites?has_content>
                <#list favorites as pkg>
                    <div class="col-md-4">
                        <div class="card h-100 shadow-sm border-0" style="border-top: 4px solid var(--danger-red) !important;">
                            <div class="card-body d-flex flex-column">
                                <div class="d-flex justify-content-between mb-3 border-bottom pb-2">
                                    <span class="badge bg-primary text-uppercase">${pkg.category}</span>
                                    <span class="text-muted small fw-bold">${(pkg.provider.name)!'Provider'}</span>
                                </div>
                                
                                <h4 class="card-title fw-bold" style="color: var(--wood-dark);">${pkg.title}</h4>
                                <p class="card-text text-muted small flex-grow-1">${pkg.description}</p>
                                
                                <div class="mt-3 text-center">
                                    <h3 class="text-success fw-bold mb-3">$${pkg.price}</h3>
                                    
                                    <div class="d-flex gap-2">
                                        <form action="/customer/favorites/toggle" method="POST" class="w-25">
                                            <input type="hidden" name="packageId" value="${pkg.id}">
                                            <input type="hidden" name="redirectUrl" value="/customer/favorites">
                                            <button type="submit" class="btn btn-outline-danger w-100 fw-bold shadow-sm" title="Remove"><i class="bi bi-trash3"></i></button>
                                        </form>
                                        <a href="/customer/provider/${pkg.provider.id}" class="btn btn-primary w-75 fw-bold shadow-sm">View & Book</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </#list>
            <#else>
                <div class="col-12 text-center py-5">
                    <i class="bi bi-heart display-1 text-muted mb-3 opacity-25"></i>
                    <h4 class="text-muted fw-bold">No saved favorites yet.</h4>
                    <a href="/browse" class="btn btn-primary mt-3 px-4 fw-bold">Find Talent</a>
                </div>
            </#if>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>