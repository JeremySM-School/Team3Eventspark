<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${(provider.name)!'Provider'} | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg custom-navbar">
        <div class="container">
            <a class="navbar-brand fs-3" href="/"><i class="bi bi-stars"></i> EventSpark</a>
            <div class="navbar-nav ms-auto">
                <a href="/provider/dashboard" class="nav-link text-light">Back to Dashboard</a>
            </div>
        </div>
    </nav>

    <div class="bg-dark text-white py-5" style="background: linear-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.8)), url('https://images.unsplash.com/photo-1492684223066-81342ee5ff30?w=1600'); background-size: cover; background-position: center;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-3 text-center h-100">
                    <img src="${(provider.imageUrls[0])!'https://ui-avatars.com/api/?name=${(provider.name!\'P\')?url}&background=4e342e&color=fff&size=150'}" class="rounded-circle border border-4 border-warning shadow mb-3" style="width: 150px; height: 150px; object-fit: cover;">
                </div>
                <div class="col-md-9">
                    <h1 class="display-4 fw-bold">${(provider.name)!'Provider'}</h1>
                    <p class="lead">${(provider.category)!'Event Services'} • ${(provider.zipCode)!'Global'}</p>
                    <div class="d-flex gap-3 mt-3">
                        <div class="text-warning"><i class="bi bi-star-fill"></i> ${(provider.rating)!5.0} (Provider Rating)</div>
                        <div class="text-light"><i class="bi bi-geo-alt-fill"></i> Travels up to ${(provider.serviceRadius)!25} miles</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container py-5">
        <div class="row">
            <div class="col-md-8">
                <h3 class="fw-bold mb-3" style="color: var(--wood-dark);">About Me</h3>
                <p class="text-muted mb-5">${(provider.bio)!'Welcome to my profile! I am excited to make your event unforgettable.'}</p>

                <h3 class="fw-bold mb-4" style="color: var(--wood-dark);">Service Packages</h3>
                
                <#if provider.packages?? && provider.packages?has_content>
                    <#list provider.packages as pkg>
                    <div class="card mb-3 border-start border-4 border-success shadow-sm">
                        <div class="card-body d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="fw-bold mb-1">${pkg.title}</h5>
                                <p class="text-muted mb-0 small">${pkg.description}</p>
                            </div>
                            <div class="text-end">
                                <h3 class="text-success fw-bold">$${pkg.price}</h3>
                            </div>
                        </div>
                    </div>
                    </#list>
                <#else>
                    <div class="alert alert-light border text-muted">No packages currently available.</div>
                </#if>
            </div>

            <div class="col-md-4">
                <div class="card shadow border-0 sticky-top" style="top: 20px;">
                    <div class="card-header text-white fw-bold text-center py-3" style="background-color: var(--wood-dark) !important;">
                        Contact Talent
                    </div>
                    <div class="card-body p-4 text-center">
                        <p class="text-muted mb-4">Interested in booking?</p>
                        <div class="d-grid gap-2">
                            <#if userRole?? && userRole == 'CUSTOMER'>
                                <a href="/customer/inbox" class="btn btn-warning btn-lg fw-bold">Message Provider</a>
                            <#else>
                                <button class="btn btn-warning btn-lg fw-bold" disabled>Login as Customer to Book</button>
                            </#if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>