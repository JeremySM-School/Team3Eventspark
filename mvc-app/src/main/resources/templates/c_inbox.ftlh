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
    <nav class="navbar navbar-expand-lg custom-navbar">
        <div class="container">
            <a class="navbar-brand fs-3" href="/">EventSpark</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="/customer/dashboard">Back to Dashboard</a>
            </div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="row">
            <div class="col-md-4">
                <div class="list-group">
                    <a href="#" class="list-group-item list-group-item-action active bg-primary border-primary">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">Active Conversation</h5>
                            <small>Thread #${threadId!1}</small>
                        </div>
                        <p class="mb-1 small">Viewing live messages from DB</p>
                    </a>
                </div>
            </div>

            <div class="col-md-8">
                <div class="card h-100">
                    <div class="card-header bg-white fw-bold">
                        Conversation History
                    </div>
                    <div class="card-body d-flex flex-column" style="height: 500px; overflow-y: auto;">
                        <div class="mb-auto">
                            <#list messages as msg>
                                <div class="p-3 rounded mb-2 w-75 ${(msg.senderId == 1)?string('bg-primary text-white ms-auto', 'bg-light')}">
                                    <small class="fw-bold ${(msg.senderId == 1)?string('text-white-50', 'text-muted')}">
                                        ${(msg.senderId == 1)?string('You', 'Provider')}
                                    </small>
                                    <p class="mb-0">${msg.content}</p>
                                    <small class="d-block mt-1 opacity-75" style="font-size: 0.7rem;">
                                        ${msg.createdAt!""}
                                    </small>
                                </div>
                            <#else>
                                <div class="text-center py-5">
                                    <p class="text-muted">No messages in this thread yet.</p>
                                </div>
                            </#list>
                        </div>
                        
                        <div class="mt-3 border-top pt-3">
                            <form action="/customer/inbox/send" method="post">
                                <input type="hidden" name="threadId" value="${threadId!1}">
                                <div class="input-group">
                                    <input type="text" name="content" class="form-control" placeholder="Type a message..." required>
                                    <button type="submit" class="btn btn-primary">Send</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>