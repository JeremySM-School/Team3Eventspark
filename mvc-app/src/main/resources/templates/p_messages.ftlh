<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Messages | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/styles.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg custom-navbar mb-4" style="background: var(--wood-dark);">
        <div class="container">
            <a class="navbar-brand fs-3 text-white" href="/"><i class="bi bi-stars"></i> EventSpark</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link text-light" href="/provider/dashboard">Back to Dashboard</a>
            </div>
        </div>
    </nav>

    <div class="container py-4">
        <h2 class="fw-bold mb-4" style="color: var(--wood-dark);">Direct Messages & Approvals</h2>
        <div class="row">
            
            <div class="col-md-4">
                <h6 class="fw-bold mb-3" style="color: var(--wood-dark);"><i class="bi bi-chat-dots me-2"></i>Active Conversations</h6>
                <div class="list-group shadow-sm">
                    <#if threads?? && threads?has_content>
                        <#list threads as thread>
                            <a href="/provider/messages?threadId=${thread.id}" class="list-group-item list-group-item-action ${(currentThreadId?? && currentThreadId == thread.id)?string('active bg-success border-success', '')}">
                                <div class="d-flex w-100 justify-content-between">
                                    <h6 class="mb-1 fw-bold">${(thread.customer.firstName)!'Customer'} ${(thread.customer.lastName)!''}</h6>
                                </div>
                                <small class="mb-1 text-truncate d-block">Thread #${thread.id}</small>
                            </a>
                        </#list>
                    <#else>
                        <div class="text-center py-5 text-muted">
                            <i class="bi bi-chat-dots display-1 opacity-25 d-block mb-3"></i>
                            <h5>No Messages Yet</h5>
                            <p>New booking requests will appear here once customers reach out.</p>
                        </div>
                    </#if>
                </div>
            </div>

            <div class="col-md-8">
                <div class="card h-100 shadow-sm border-0">
                    
                    <#if activeRequest??>
                    <div class="card-header bg-white border-bottom p-4">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <div>
                                <span class="badge bg-${(activeRequest.status == 'PENDING')?string('warning', (activeRequest.status == 'APPROVED')?string('success', 'danger'))} mb-2 fs-6 text-dark border">
                                    ${activeRequest.status}
                                </span>
                                <h4 class="fw-bold mb-1">${(activeRequest.event.eventName)!'Event'}</h4>
                                <p class="text-muted mb-0"><i class="bi bi-calendar-event me-2"></i>${(activeRequest.event.eventDate?replace('T', ' at '))!'Date TBD'}</p>
                            </div>
                            <div class="text-end">
                                <h3 class="fw-bold text-success mb-0">$${activeRequest.totalPrice}</h3>
                                <small class="text-muted">${(activeRequest.servicePackages[0].title)!'Package'}</small>
                            </div>
                        </div>

                        <div class="d-flex gap-2">
                            <#if activeRequest.status == 'PENDING'>
                                <form action="/provider/inbox/update" method="POST" class="w-50">
                                    <input type="hidden" name="requestId" value="${activeRequest.id}">
                                    <input type="hidden" name="threadId" value="${currentThreadId}">
                                    <input type="hidden" name="newStatus" value="APPROVED">
                                    <button type="submit" class="btn btn-success w-100 fw-bold shadow-sm">Approve Booking</button>
                                </form>
                                <form action="/provider/inbox/update" method="POST" class="w-50">
                                    <input type="hidden" name="requestId" value="${activeRequest.id}">
                                    <input type="hidden" name="threadId" value="${currentThreadId}">
                                    <input type="hidden" name="newStatus" value="REJECTED">
                                    <button type="submit" class="btn btn-danger w-100 fw-bold shadow-sm">Decline</button>
                                </form>
                            </#if>
                            <#if activeRequest.status == 'APPROVED'>
                                <form action="/provider/inbox/update" method="POST">
                                    <input type="hidden" name="requestId" value="${activeRequest.id}">
                                    <input type="hidden" name="threadId" value="${currentThreadId}">
                                    <input type="hidden" name="newStatus" value="CANCELLED">
                                    <button type="submit" class="btn btn-outline-danger btn-sm fw-bold" onclick="return confirm('Are you sure you want to cancel this approved booking?');">Cancel Booking</button>
                                </form>
                            </#if>
                        </div>
                    </div>
                    </#if>

                    <div class="card-body d-flex flex-column" style="height: 400px; overflow-y: auto; background-color: #f8f9fa;">
                        <div class="mb-auto">
                            <#if messages?? && messages?has_content>
                                <#list messages as msg>
                                    <div class="p-3 rounded mb-2 w-75 ${(msg.sender.id == currentUserId)?string('bg-success text-white ms-auto shadow-sm', 'bg-white border shadow-sm')}">
                                        <small class="fw-bold ${(msg.sender.id == currentUserId)?string('text-white-50', 'text-muted')}">
                                            ${(msg.sender.id == currentUserId)?string('You', 'Customer')}
                                        </small>
                                        <p class="mb-0 ${(msg.sender.id == currentUserId)?string('text-white', 'text-dark')}">${msg.content}</p>
                                    </div>
                                </#list>
                            <#else>
                                <div class="text-center py-5 text-muted">
                                    <i class="bi bi-chat-left-text display-4 text-muted opacity-50 mb-3 d-block"></i>
                                    Select a thread or wait for a customer to message you!
                                </div>
                            </#if>
                        </div>
                        
                        <#if currentThreadId??>
                        <div class="mt-3 border-top pt-4">
                            <form action="/provider/messages/send" method="post">
                                <input type="hidden" name="threadId" value="${currentThreadId}">
                                <div class="input-group shadow-sm">
                                    <input type="text" name="content" class="form-control border-success py-2" placeholder="Reply to customer..." required>
                                    <button type="submit" class="btn btn-success fw-bold px-4">Send</button>
                                </div>
                            </form>
                        </div>
                        </#if>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>