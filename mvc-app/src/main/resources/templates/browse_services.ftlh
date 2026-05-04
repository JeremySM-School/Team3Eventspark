<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Browse Services | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles.css">
</head>
<body class="bg-light">

    <div class="container py-5">
        <h2 class="fw-bold mb-4">Discover Event Services</h2>

        <div class="row g-4">
            <#list packages as pkg>
            <div class="col-md-4">
                <div class="card h-100 shadow-sm border-0">
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-2">
                            <span class="badge bg-primary">${pkg.category}</span>
                            <span class="text-muted small"><i class="bi bi-person"></i> ${(pkg.provider.name)!'Provider'}</span>
                        </div>
                        
                        <h5 class="card-title fw-bold">${pkg.title}</h5>
                        <p class="card-text text-muted small">${pkg.description}</p>
                        <h4 class="text-success fw-bold mb-3">$${pkg.price}</h4>
                        
                        <a href="/checkout?packageId=${pkg.id}" class="btn btn-outline-primary w-100 fw-bold">Request Booking</a>
                    </div>
                </div>
            </div>
            </#list>

            <#if packages?size == 0>
                <div class="col-12 text-center py-5">
                    <h4 class="text-muted">No services available right now. Check back later!</h4>
                </div>
            </#if>
        </div>
    </div>

</body>
</html>