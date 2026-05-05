<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Calendar | EventSpark</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles.css">
    <style>
        .calendar-day { height: 100px; border: 1px solid #eee; position: relative; flex: 0 0 14.28%; max-width: 14.28%; }
        .calendar-day:hover { background-color: #f8f9fa; cursor: pointer; }
        .booked { background-color: #ffebee; border-left: 4px solid #c62828; }
        .day-num { position: absolute; top: 5px; left: 8px; font-weight: bold; font-size: 0.9rem; }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg custom-navbar">
        <div class="container">
            <a class="navbar-brand fs-3" href="/">EventSpark</a>
            <div class="navbar-nav ms-auto"><a class="nav-link" href="/provider/dashboard">Back to Dashboard</a></div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="row">
            <div class="col-lg-8 mb-4">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h3 class="fw-bold" id="calendar-month-year">Current Month</h3>
                    <div class="btn-group">
                        <button class="btn btn-outline-secondary btn-sm">&lt;</button>
                        <button class="btn btn-outline-secondary btn-sm">&gt;</button>
                    </div>
                </div>

                <div class="card shadow-sm">
                    <div class="card-body p-0">
                        <div class="row g-0 text-center fw-bold bg-light py-2 border-bottom">
                            <div class="col">Sun</div><div class="col">Mon</div><div class="col">Tue</div><div class="col">Wed</div><div class="col">Thu</div><div class="col">Fri</div><div class="col">Sat</div>
                        </div>
                        
                        <div id="dynamic-calendar" class="row g-0"></div>
                        
                    </div>
                </div>

                <script>
                    document.addEventListener("DOMContentLoaded", function() {
                        const calendarGrid = document.getElementById('dynamic-calendar');
                        const today = new Date();
                        const month = today.getMonth();
                        const year = today.getFullYear();
                        document.getElementById('calendar-month-year').innerText = today.toLocaleString('default', { month: 'long', year: 'numeric' });
                        
                        const firstDay = new Date(year, month, 1).getDay();
                        const daysInMonth = new Date(year, month + 1, 0).getDate();
                        
                        // Pull dates from FreeMarker into a JS Array safely
                        const gigDates = [
                            <#list gigs as gig>"${gig.eventDate!gig.createdAt.toLocalDate()}"<#sep>,</#list>
                        ];

                        let gridHTML = '';
                        
                        // Empty slots before the 1st
                        for(let i=0; i < firstDay; i++) {
                             gridHTML += '<div class="col calendar-day bg-light border-bottom border-end"></div>';
                        }
                        
                        // Actual days
                        for(let i=1; i <= daysInMonth; i++) {
                             // Format: YYYY-MM-DD
                             const dateStr = year + "-" + String(month+1).padStart(2, '0') + "-" + String(i).padStart(2, '0');
                             const isBooked = gigDates.some(g => g.startsWith(dateStr));
                             
                             // Using standard JS string concatenation so FreeMarker doesn't crash
                             gridHTML += '<div class="col calendar-day border-bottom border-end ' + (isBooked ? 'booked' : '') + '" style="min-width: 14%;">' +
                                         '<span class="day-num">' + i + '</span>' +
                                         (isBooked ? '<span class="badge bg-danger mt-4 ms-1">Gig</span>' : '') +
                                         '</div>';
                        }
                        calendarGrid.innerHTML = gridHTML;
                    });
                </script>
            </div>

            <div class="col-lg-4">
                <h4 class="fw-bold mb-3">Upcoming Agenda</h4>
                
                <#list gigs as gig>
                <div class="card mb-3 border-start border-4 border-danger shadow-sm">
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-2">
                            <strong class="text-danger">${gig.eventDate!gig.createdAt.toLocalDate()}</strong>
                            <span class="badge bg-success border text-white">Confirmed</span>
                        </div>
                        <h6 class="fw-bold mb-1">${gig.event.name}</h6>
                        <p class="small text-muted mb-2">Package: ${gig.servicePackages[0].title}</p>
                        <a href="/provider/inbox" class="btn btn-sm btn-outline-secondary w-100">Go to Inbox</a>
                    </div>
                </div>
                </#list>

                <#if gigs?size == 0>
                    <div class="alert alert-light border text-center text-muted">
                        No upcoming gigs scheduled yet.
                    </div>
                </#if>

                <div class="card bg-light border-0 mt-4">
                    <div class="card-body text-center">
                        <p class="small text-muted mb-2">Need to block out time?</p>
                        <button class="btn btn-primary btn-sm w-100">Add Personal Time Off</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>