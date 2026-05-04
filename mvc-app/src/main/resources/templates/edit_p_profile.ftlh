<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Profile | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg custom-navbar">
        <div class="container">
            <a class="navbar-brand fs-3" href="../home/home.html">EventSpark</a>
            <div class="navbar-nav ms-auto"><a class="nav-link" href="p_dashboard.html">Back to Dashboard</a></div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="fw-bold">Edit Public Profile</h2>
                    <a href="p_profile.html" target="_blank" class="btn btn-outline-primary btn-sm">View Public Page</a>
                </div>

                <div class="card shadow-sm">
                    <div class="card-body p-4">
                        <form action="/provider/profile/edit" method="POST">
                            
                            <div class="row mb-3">
                                <div class="col-md-12">
                                    <label class="form-label fw-bold small">Stage Name</label>
                                    <input type="text" name="name" class="form-control" value="${(provider.name)!''}" required>
                                </div>
                            </div>

                            <div class="mb-4">
                                <label class="form-label fw-bold small">Profile Categories (Select all that apply)</label>
                                <div class="d-flex flex-wrap gap-2">
                                    <input type="checkbox" class="btn-check" id="cat1" name="category" value="DJ">
                                    <label class="btn btn-outline-secondary btn-sm rounded-pill px-3" for="cat1">DJ</label>

                                    <input type="checkbox" class="btn-check" id="cat2" name="category" value="Live Band">
                                    <label class="btn btn-outline-secondary btn-sm rounded-pill px-3" for="cat2">Live Band</label>
                                    
                                    <input type="checkbox" class="btn-check" id="cat3" name="category" value="Photographer">
                                    <label class="btn btn-outline-secondary btn-sm rounded-pill px-3" for="cat3">Photographer</label>

                                    <input type="checkbox" class="btn-check" id="cat4" name="category" value="Videographer">
                                    <label class="btn btn-outline-secondary btn-sm rounded-pill px-3" for="cat4">Videographer</label>

                                    <input type="checkbox" class="btn-check" id="cat5" name="category" value="Catering">
                                    <label class="btn btn-outline-secondary btn-sm rounded-pill px-3" for="cat5">Catering</label>

                                    <input type="checkbox" class="btn-check" id="cat6" name="category" value="Decorator">
                                    <label class="btn btn-outline-secondary btn-sm rounded-pill px-3" for="cat6">Decorator</label>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold small">Bio</label>
                                <textarea name="bio" class="form-control" rows="4" required>${(provider.bio)!''}</textarea>
                            </div>

                            <div class="d-grid mt-5">
                                <button type="submit" class="btn btn-primary btn-lg">Save Profile & Tags</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>