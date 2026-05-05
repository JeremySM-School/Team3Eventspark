<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Provider Inbox | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/styles.css">
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg custom-navbar mb-4" style="background: var(--wood-dark);">
        <div class="container">
            <a class="navbar-brand fs-3" href="/"><i class="bi bi-stars"></i> EventSpark</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="navbar-nav ms-auto">
                    <a class="nav-link" href="/provider/dashboard">Dashboard</a>
                    <a class="nav-link active" href="/provider/inbox">
                        Inbox 
                        <#if pendingCount?? && pendingCount &gt; 0>
                            <span class="badge bg-danger rounded-pill">${pendingCount}</span>
                        </#if>
                    </a>
                    <a class="nav-link" href="/provider/profile/edit">My Profile</a>
                    <a class="nav-link text-warning" href="/logout">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container py-4">
        <h2 class="fw-bold mb-4" style="color: var(--wood-dark);">Booking Inbox</h2>

        <div class="row g-4">
            <div class="col-md-12">
                <h5 class="fw-bold text-danger mb-3"><i class="bi bi-exclamation-circle-fill me-2"></i>Action Required</h5>
                
                <#assign hasPending = false>
                <#list requests as req>
                    <#if req.status == 'PENDING'>
                        <#assign hasPending = true>
                        <div class="card shadow-sm border-0 mb-3" style="border-left: 5px solid var(--gold-accent) !important;">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-md-8">
                                        <div class="d-flex align-items-center mb-2">
                                            <span class="badge bg-warning text-dark me-2">PENDING</span>
                                            <small class="text-muted">Requested on ${req.createdAt.toLocalDate()}</small>
                                        </div>
                                        <h5 class="fw-bold mb-1">${(req.event.eventName)!'Unnamed Event'}</h5>
                                        <p class="text-muted mb-0"><i class="bi bi-person me-1"></i> Customer: ${(req.event.customer.firstName)!''} ${(req.event.customer.lastName)!''}</p>
                                        
                                        <hr class="opacity-25">
                                        <p class="mb-0 small fw-bold">Requested Package: 
                                            <span class="text-primary">${req.servicePackages[0].title}</span> 
                                            <span class="text-success ms-2">($${req.totalPrice})</span>
                                        </p>
                                    </div>
                                    <div class="col-md-4 text-end">
                                        <form action="/provider/inbox/update" method="POST" class="d-inline">
                                            <input type="hidden" name="requestId" value="${req.id}">
                                            <input type="hidden" name="newStatus" value="APPROVED">
                                            <button type="submit" class="btn btn-success fw-bold px-4 me-2 shadow-sm"><i class="bi bi-check-lg me-1"></i>Approve</button>
                                        </form>
                                        
                                        <form action="/provider/inbox/update" method="POST" class="d-inline">
                                            <input type="hidden" name="requestId" value="${req.id}">
                                            <input type="hidden" name="newStatus" value="REJECTED">
                                            <button type="submit" class="btn btn-outline-danger fw-bold px-3"><i class="bi bi-x-lg"></i></button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </#if>
                </#list>

                <#if !hasPending>
                    <div class="alert alert-light text-center py-4 border text-muted shadow-sm">
                        <i class="bi bi-inbox fs-1 d-block mb-2 opacity-50"></i>
                        You're all caught up! No pending requests.
                    </div>
                </#if>
            </div>

            <div class="col-md-12 mt-5">
                <h5 class="fw-bold text-muted mb-3"><i class="bi bi-clock-history me-2"></i>Past Activity</h5>
                
                <#list requests as req>
                    <#if req.status != 'PENDING'>
                        <div class="card shadow-sm border-0 mb-2 bg-white">
                            <div class="card-body py-3">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h6 class="fw-bold mb-1">${(req.event.eventName)!'Unnamed Event'}</h6>
                                        <small class="text-muted">${req.servicePackages[0].title} • $${req.totalPrice}</small>
                                    </div>
                                    <div>
                                        <#if req.status == 'APPROVED'>
                                            <span class="badge bg-success">APPROVED</span>
                                        <#elseif req.status == 'REJECTED'>
                                            <span class="badge bg-danger">REJECTED</span>
                                        <#else>
                                            <span class="badge bg-secondary">${req.status}</span>
                                        </#if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </#if>
                </#list>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>