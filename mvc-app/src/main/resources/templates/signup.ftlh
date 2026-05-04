<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EventSpark | Sign Up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body class="d-flex align-items-center justify-content-center vh-100" style="background-color: var(--wood-dark);">

    <div class="card p-5 shadow-lg" style="width: 100%; max-width: 450px; border-top: 5px solid var(--gold-accent);">
        
        <h3 class="text-center mb-4 fw-bold" style="color: var(--wood-dark);">Join EventSpark</h3>
        <p class="text-center text-muted mb-4">Create an account to discover or host events.</p>
        
        <form action="/signup" method="POST">
            <div class="mb-3">
                <label class="form-label small fw-bold text-uppercase text-muted">Full Name</label>
                <input type="text" name="fullName" class="form-control" placeholder="e.g. John Doe" required>
            </div>
            <div class="mb-3">
                <label class="form-label small fw-bold text-uppercase text-muted">Email Address</label>
                <input type="email" name="email" class="form-control" placeholder="name@example.com" required>
            </div>
            <div class="mb-4">
                <label class="form-label small fw-bold text-uppercase text-muted">Password</label>
                <input type="password" name="password" class="form-control" placeholder="••••••••" required>
            </div>

            <label class="form-label small fw-bold text-uppercase text-muted">I am a...</label>
            <div class="row g-2 mb-4">
                <div class="col-6">
                    <input type="radio" class="btn-check" name="role" id="roleCustomer" value="CUSTOMER" required>
                    <label class="btn btn-outline-primary w-100 py-2 fw-bold" for="roleCustomer">Customer</label>
                </div>
                <div class="col-6">
                    <input type="radio" class="btn-check" name="role" id="roleProvider" value="PROVIDER" required>
                    <label class="btn btn-outline-primary w-100 py-2 fw-bold" for="roleProvider">Provider</label>
                </div>
            </div>

            <button type="submit" class="btn btn-primary w-100 btn-lg shadow-sm">
                <i class="bi bi-person-plus-fill me-2"></i>Sign Up
            </button>
        </form>

        <div class="text-center mt-4">
            <p class="small text-muted">Already have an account? <a href="/login" class="fw-bold text-decoration-none" style="color: var(--wood-light);">Login</a></p>
            
            <a href="/" class="btn btn-sm btn-light text-muted w-100 mt-2">
                <i class="bi bi-arrow-left"></i> Return to Home
            </a>
        </div>
    </div>

</body>
</html>