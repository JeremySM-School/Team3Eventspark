<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Packages | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/styles.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg custom-navbar mb-4" style="background: var(--wood-dark);">
        <div class="container">
            <a class="navbar-brand fs-3" href="/"><i class="bi bi-stars"></i> EventSpark</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="navbar-nav ms-auto">
                    <a class="nav-link fw-bold text-light" href="/provider/dashboard">Back to Dashboard</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold">My Service Packages</h2>
            <button class="btn btn-primary fw-bold"><i class="bi bi-plus-lg me-1"></i> Add New Package</button>
        </div>

        <div class="card mb-4 shadow-sm border-primary">
            <div class="card-body">
                <h5 class="fw-bold text-primary">Create New Package</h5>
                <form action="/provider/packages/new" method="POST">
                    <div class="mb-3">
                        <label class="form-label fw-bold small">Package Title</label>
                        <input type="text" name="title" class="form-control" placeholder='e.g., "Another One" Wedding Set' required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold small">Service Category</label>
                        <select name="category" class="form-select border-primary" required>
                            <option value="WEDDING">Wedding Services</option>
                            <option value="CORPORATE">Corporate Events</option>
                            <option value="PARTY">Private Party</option>
                            <option value="MUSIC">Music & Entertainment</option>
                            <option value="OTHER">Other</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold small">Description</label>
                        <textarea name="description" class="form-control" rows="2" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold small">Price ($)</label>
                        <input type="number" step="0.01" name="price" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary fw-bold w-100">Submit Package</button>
                </form>
            </div>
        </div>

        <h3 class="fw-bold mt-5 mb-3" style="color: var(--wood-dark);">My Active Packages</h3>
        
        <#list packageList as pkg>
        <div class="card mb-3 border-start border-4 border-warning shadow-sm">
            <div class="card-body d-flex justify-content-between align-items-center">
                <div>
                    <h5 class="fw-bold mb-1">${pkg.title}</h5>
                    <p class="text-muted mb-1 small">${pkg.description}</p>
                    <span class="badge bg-light text-dark border">${pkg.category}</span>
                </div>
                <div class="text-end">
                    <h3 class="text-success fw-bold mb-1">$${pkg.price}</h3>
                    <div>
                        <button class="btn btn-sm btn-outline-secondary me-1">Edit</button>
                        <form action="/provider/packages/delete" method="POST" class="mt-3" onsubmit="return confirm('Are you sure you want to delete this package?');">
                            <input type="hidden" name="packageId" value="${pkg.id}">
                            <button type="submit" class="btn btn-sm btn-outline-danger w-100">
                                <i class="bi bi-trash3-fill me-2"></i>Delete Package
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </#list>
        
        <#if packageList?size == 0>
            <p class="text-muted">You haven't created any packages yet.</p>
        </#if>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>