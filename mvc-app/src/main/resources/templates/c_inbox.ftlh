<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Inbox | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg custom-navbar mb-4" style="background: var(--wood-dark);">
        <div class="container">
            <a class="navbar-brand fs-3 text-white fw-bold" href="/"><i class="bi bi-stars"></i> EventSpark</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#customerNav">
                <span class="navbar-toggler-icon" style="filter: invert(1);"></span>
            </button>
            <div class="collapse navbar-collapse" id="customerNav">
                <div class="navbar-nav ms-auto align-items-center">
                    <a class="nav-link text-light px-3" href="/customer/dashboard">Dashboard</a>
                    <a class="nav-link text-light px-3" href="/browse">Find Talent</a>
                    <a class="nav-link text-light px-3" href="/customer/inbox">Inbox</a>
                    <a class="nav-link text-light px-3" href="/customer/reviews">My Reviews</a>
                    <a class="nav-link text-warning fw-bold px-3" href="/logout">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container py-4">
        <h2 class="fw-bold mb-4" style="color: var(--wood-dark);">My Inbox</h2>
        <div class="row">
            
            <div class="col-md-4">
                
                <h6 class="fw-bold mb-3 mt-2" style="color: var(--wood-dark);"><i class="bi bi-hourglass-split me-2"></i>Pending Requests</h6>
                <div class="list-group mb-4 shadow-sm">
                    <#if pendingRequests?? && pendingRequests?has_content>
                        <#list pendingRequests as req>
                            <div class="list-group-item bg-light border-warning border-start border-4 py-3">
                                <div class="d-flex justify-content-between">
                                    <h6 class="mb-1 fw-bold">${(req.provider.name)!'Provider'}</h6>
                                    <span class="badge bg-warning text-dark">Pending</span>
                                </div>
                                <small class="text-muted text-truncate d-block">For: ${(req.event.eventName)!""}</small>
                            </div>
                        </#list>
                    <#else>
                        <div class="text-muted small p-4 text-center border bg-white rounded shadow-sm">No pending requests.</div>
                    </#if>
                </div>
                
                <h6 class="fw-bold mb-3" style="color: var(--wood-dark);"><i class="bi bi-chat-dots me-2"></i>Active Conversations</h6>
                <div class="list-group shadow-sm">
                    <#if threads?? && threads?has_content>
                        <#list threads as thread>
                            <a href="/customer/inbox?threadId=${thread.id}" class="list-group-item list-group-item-action ${(currentThreadId?? && currentThreadId == thread.id)?string('active bg-primary border-primary', '')}">
                                <div class="d-flex w-100 justify-content-between">
                                    <h6 class="mb-1 fw-bold">${(thread.provider.name)!'Provider'}</h6>
                                </div>
                                <small class="mb-1 text-truncate d-block">Thread #${thread.id}</small>
                            </a>
                        </#list>
                    <#else>
                        <div class="p-4 text-muted small text-center bg-white border rounded shadow-sm">No active conversations.</div>
                    </#if>
                </div>
            </div>

            <div class="col-md-8">
                <div class="card h-100 shadow-sm border-0">
                    <div class="card-header bg-white fw-bold py-3 fs-5">
                        Message History
                    </div>
                    <div class="card-body d-flex flex-column" style="height: 500px; overflow-y: auto;">
                        <div class="mb-auto">
                            <#if messages?? && messages?has_content>
                                <#list messages as msg>
                                    <div class="p-3 rounded mb-2 w-75 ${(msg.sender.id == currentUserId)?string('bg-primary text-white ms-auto', 'bg-light')}">
                                        <small class="fw-bold ${(msg.sender.id == currentUserId)?string('text-white-50', 'text-muted')}">
                                            ${(msg.sender.id == currentUserId)?string('You', 'Provider')}
                                        </small>
                                        <p class="mb-0">${msg.content}</p>
                                    </div>
                                </#list>
                            <#else>
                                <div class="text-center py-5">
                                    <i class="bi bi-chat-left-text display-4 text-muted opacity-50 mb-3 d-block"></i>
                                    <p class="text-muted">Select a thread or wait for a provider to message you!</p>
                                </div>
                            </#if>
                        </div>
                        
                        <#if currentThreadId??>
                        <div class="mt-3 border-top pt-3">
                            <form action="/customer/inbox/send" method="post">
                                <input type="hidden" name="threadId" value="${currentThreadId}">
                                <div class="input-group">
                                    <input type="text" name="content" class="form-control border-primary" placeholder="Type a message..." required>
                                    <button type="submit" class="btn btn-primary fw-bold px-4">Send</button>
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