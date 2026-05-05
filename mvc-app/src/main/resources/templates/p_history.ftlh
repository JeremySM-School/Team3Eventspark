<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking History | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/styles.css">
</head>
<body>

    <nav class="navbar navbar-expand-lg custom-navbar mb-4" style="background: var(--wood-dark);">
        <div class="container">
            <a class="navbar-brand fs-3 text-white" href="/"><i class="bi bi-stars"></i> EventSpark</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="navbar-nav ms-auto">
                    <a class="nav-link text-light" href="/provider/dashboard">Dashboard</a>
                    <a class="nav-link text-light" href="/provider/messages">Messages</a>
                    <a class="nav-link active text-white fw-bold" href="/provider/history">History</a>
                    <a class="nav-link text-light" href="/provider/profile/edit">My Profile</a>
                    <a class="nav-link text-warning" href="/logout">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container py-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold mb-0" style="color: var(--wood-dark);">Booking Ledger</h2>
            <button class="btn btn-outline-secondary btn-sm"><i class="bi bi-download me-2"></i>Export CSV</button>
        </div>

        <div class="card shadow-sm border-0">
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead class="table-light">
                            <tr>
                                <th class="ps-4 py-3">Event Details</th>
                                <th class="py-3">Service Package</th>
                                <th class="py-3">Date Created</th>
                                <th class="py-3">Revenue</th>
                                <th class="pe-4 py-3 text-end">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <#if requests?? && requests?has_content>
                                <#list requests as req>
                                    <tr>
                                        <td class="ps-4 py-3">
                                            <h6 class="fw-bold mb-1">${(req.event.eventName)!'Unnamed Event'}</h6>
                                            <small class="text-muted"><i class="bi bi-geo-alt me-1"></i>${(req.event.location)!'Location TBD'}</small>
                                        </td>
                                        <td class="py-3 text-muted">${(req.servicePackages[0].title)!'Custom Service'}</td>
                                        <td class="py-3 text-muted">${(req.createdAt?keep_before('T'))!''}</td>
                                        <td class="py-3 fw-bold text-success">$${req.totalPrice?string(",##0.00")}</td>
                                        <td class="pe-4 py-3 text-end">
                                            <#if req.status == 'APPROVED'>
                                                <span class="badge bg-success bg-opacity-10 text-success border border-success">APPROVED</span>
                                            <#elseif req.status == 'REJECTED'>
                                                <span class="badge bg-danger bg-opacity-10 text-danger border border-danger">REJECTED</span>
                                            <#elseif req.status == 'CANCELLED'>
                                                <span class="badge bg-secondary bg-opacity-10 text-secondary border border-secondary">CANCELLED</span>
                                            <#else>
                                                <span class="badge bg-light text-dark border">${req.status}</span>
                                            </#if>
                                        </td>
                                    </tr>
                                </#list>
                            <#else>
                                <tr>
                                    <td colspan="5" class="text-center py-5 text-muted">
                                        <i class=\"bi bi-receipt display-4 d-block mb-3 opacity-25\"></i>
                                        No booking history found.
                                    </td>
                                </tr>
                            </#if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>