<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EventSpark | Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body class="d-flex align-items-center justify-content-center vh-100" style="background-color: var(--wood-dark);">

    <div class="card p-5 shadow-lg text-center" style="width: 100%; max-width: 420px; border-top: 5px solid var(--gold-accent);">
        
        <a href="/" class="text-decoration-none mb-4 d-block">
            <h2 class="fw-bold" style="color: var(--wood-dark);">
                <i class="bi bi-stars"></i> EventSpark
            </h2>
        </a>

        <h4 class="mb-4 text-muted">Welcome Back</h4>

        <#if RequestParameters.error??>
            <div class="alert alert-danger alert-dismissible fade show text-start small shadow-sm" role="alert">
                <i class="bi bi-exclamation-triangle-fill me-2"></i> <strong>Login Failed.</strong> Please check your email and password.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </#if>

        <form action="/login" method="POST" class="text-start">
            <div class="mb-3">
                <label class="form-label fw-bold small text-muted">Email Address</label>
                <input type="email" name="email" class="form-control" required placeholder="name@example.com">
            </div>
            <div class="mb-4">
                <label class="form-label fw-bold small text-muted">Password</label>
                <input type="password" name="password" class="form-control" required placeholder="••••••••">
            </div>
            <button type="submit" class="btn btn-primary w-100 btn-lg shadow-sm">
                <i class="bi bi-box-arrow-in-right me-2"></i>Log In
            </button>
        </form>

        <hr class="text-muted opacity-25 mt-4">

        <div class="mt-3">
            <p class="mb-2">New here? <a href="/signup" class="fw-bold text-decoration-none" style="color: var(--wood-light);">Create Account</a></p>
            
            <a href="/" class="btn btn-sm btn-light text-muted w-100 mt-2">
                <i class="bi bi-arrow-left"></i> Return to Home
            </a>
        </div>
    </div>

</body>
</html>