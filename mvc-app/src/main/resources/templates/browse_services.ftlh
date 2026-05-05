<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Browse Services | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark custom-navbar mb-4" style="background: var(--wood-dark);">
        <div class="container">
            <a class="navbar-brand fw-bold" href="/"><i class="bi bi-stars"></i> EventSpark</a>
            <div class="ms-auto">
                <#if userId??>
                    <#if userRole == 'PROVIDER'>
                        <a href="/provider/dashboard" class="btn btn-outline-light me-2">My Dashboard</a>
                    <#else>
                        <a href="/customer/dashboard" class="btn btn-outline-light me-2">My Dashboard</a>
                    </#if>
                    <a href="/logout" class="btn btn-warning fw-bold text-dark">Logout</a>
                <#else>
                    <a href="/login" class="btn btn-outline-light me-2">Login</a>
                    <a href="/signup" class="btn btn-light fw-bold text-dark">Sign Up</a>  
                </#if>
            </div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="text-center mb-5">
            <h2 class="fw-bold display-5" style="color: var(--wood-dark);">Discover Event Services</h2>
            <p class="text-muted lead">Find the perfect provider for your next big event.</p>
            <div class="row justify-content-center mt-4">
                <div class="col-md-6">
                    <input type="text" id="serviceSearch" class="form-control form-control-lg shadow-sm border-primary" placeholder="Search by provider, category, or title...">
                </div>
            </div>
        </div>

        <div class="row g-4">
            <#list packages as pkg>
            <div class="col-md-4">
                <div class="card h-100 shadow-sm border-0" style="border-top: 4px solid var(--gold-accent) !important;">
                    <div class="card-body d-flex flex-column">
                        
                        <div class="d-flex justify-content-between mb-3 border-bottom pb-2">
                            <span class="badge bg-primary text-uppercase">${pkg.category}</span>
                            <span class="text-muted small fw-bold"><i class="bi bi-person-circle me-1"></i> ${(pkg.provider.name)!'Provider'}</span>
                        </div>
                        
                        <h4 class="card-title fw-bold" style="color: var(--wood-dark);">${pkg.title}</h4>
                        <p class="card-text text-muted small flex-grow-1">${pkg.description}</p>
                        
                        <div class="mt-3 text-center">
                            <h3 class="text-success fw-bold mb-3">$${pkg.price}</h3>
                            <a href="/customer/checkout?packageId=${pkg.id}" class="btn btn-primary w-100 fw-bold shadow-sm">Request Booking</a>

                            <a href="/customer/provider/${pkg.provider.id}" class="btn btn-outline-primary w-100 fw-bold shadow-sm">View Profile & Book</a>
                        </div>
                        
                    </div>
                </div>
            </div>
            </#list>

            <#if packages?size == 0>
                <div class="col-12 text-center py-5">
                    <i class="bi bi-search display-1 text-muted mb-3 opacity-25"></i>
                    <h4 class="text-muted fw-bold">No services available right now.</h4>
                    <p class="text-muted">Check back later or sign up as a Provider to add your own!</p>
                </div>
            </#if>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById('serviceSearch').addEventListener('keyup', function() {
            let filter = this.value.toLowerCase();
            let cards = document.querySelectorAll('.col-md-4'); // The package cards
            cards.forEach(card => {
                let text = card.innerText.toLowerCase();
                card.style.display = text.includes(filter) ? '' : 'none';
            });
        });
    </script>
</body>
</html>