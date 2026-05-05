<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout | EventSpark</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>

<header>
    <h1>Checkout Page</h1>
</header>

<main class="checkout-container">
    <section class="payment">
        <h2>Payment Information</h2>
        
        <!-- Action points to your processing controller -->
        <form action="/customer/checkout/process" method="POST">

            <div class="form-group">
                <label for="cardholderName">Cardholder Name</label>
                <input type="text" id="cardholderName" name="cardholderName" required>
            </div>

            <div class="form-group">
                <label for="cardNumber">Card Number</label>
                <input type="text" id="cardNumber" name="cardNumber" placeholder="0000 0000 0000 0000" required>
            </div>

            <div class="form-group">
                <label for="expiryDate">Expiry Date</label>
                <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" required>
            </div>

            <div class="form-group">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="123" required>
            </div>

            <input type="hidden" name="packageId" value="${pkg.id}">

            <button type="submit" class="btn-complete">Complete Purchase</button>
        </form>
    </section>

    <aside class="order-summary">
        <h3>Order Summary</h3>

        <div class="order-item">
            <span><strong>Package:</strong></span>
            <span>${pkg.title}</span>
        </div>

        <div class="order-item">
            <span><strong>Description:</strong></span>
            <p>${pkg.description}</p>
        </div>

        <div class="order-item">
            <span><strong>Price:</strong></span>
            <span class="price-tag">$${pkg.price?string(",##0.00")}</span>
        </div>
    </aside>
</main>

</body>
</html>