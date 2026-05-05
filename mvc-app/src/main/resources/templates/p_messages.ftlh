<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Messages | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles.css">
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg custom-navbar mb-4" style="background: var(--wood-dark);">
        <div class="container">
            <a class="navbar-brand fs-3" href="/"><i class="bi bi-stars"></i> EventSpark</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link text-light" href="/provider/dashboard">Back to Dashboard</a>
            </div>
        </div>
    </nav>

    <div class="container py-4">
        <h2 class="fw-bold mb-4" style="color: var(--wood-dark);">Direct Messages</h2>
        <div class="row">
            <div class="col-md-4">
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
                        <div class="p-4 text-muted text-center border bg-white rounded">No active messages.</div>
                    </#if>
                </div>
            </div>

            <div class="col-md-8">
                <div class="card h-100 shadow-sm border-0">
                    <div class="card-header bg-white fw-bold py-3">Conversation History</div>
                    <div class="card-body d-flex flex-column" style="height: 500px; overflow-y: auto;">
                        <div class="mb-auto">
                            <#if messages?? && messages?has_content>
                                <#list messages as msg>
                                    <div class="p-3 rounded mb-2 w-75 ${(msg.senderId == currentUserId)?string('bg-success text-white ms-auto', 'bg-light')}">
                                        <small class="fw-bold ${(msg.senderId == currentUserId)?string('text-white-50', 'text-muted')}">
                                            ${(msg.senderId == currentUserId)?string('You', 'Customer')}
                                        </small>
                                        <p class="mb-0">${msg.content}</p>
                                    </div>
                                </#list>
                            <#else>
                                <div class="text-center py-5 text-muted">Select a thread or wait for a customer to message you!</div>
                            </#if>
                        </div>
                        
                        <#if currentThreadId??>
                        <div class="mt-3 border-top pt-3">
                            <form action="/provider/messages/send" method="post">
                                <input type="hidden" name="threadId" value="${currentThreadId}">
                                <div class="input-group">
                                    <input type="text" name="content" class="form-control border-success" placeholder="Reply to customer..." required>
                                    <button type="submit" class="btn btn-success fw-bold">Send</button>
                                </div>
                            </form>
                        </div>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>