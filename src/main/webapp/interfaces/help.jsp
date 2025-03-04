<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }

        header {
            background: #007bff;
            color: white;
            text-align: center;
            padding: 20px 0;
            font-size: 1.8rem;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        main {
            display: flex;
            margin-left: 150px;
            padding: 30px 0;
        }

        .container {
            width: 90%;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 2rem;
            margin-bottom: 10px;
        }

        h2 {
            color: #007bff;
            margin-bottom: 10px;
            font-size: 1.5rem;
        }

        p {
            font-size: 1.1rem;
            margin-bottom: 20px;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        ul li {
            background: #e9ecef;
            padding: 12px;
            margin-bottom: 8px;
            border-radius: 5px;
            font-size: 1rem;
        }

        .book-button {
            display: inline-block;
            padding: 12px 30px;
            margin-left: 200px;
            color: #007bff;
            text-decoration: none;
            font-size: 1.1rem;
            border-radius: 25px;
            transition: 0.3s;
        }

        .book-button:hover {
            color: #0066cc;
        }

        footer {
            text-align: center;
            padding: 5px;
            background: #007bff;
            color: white;
            margin-top: 30px;
            font-size: 1rem;
        }

    </style>

    <title>Help - Mega City Cab</title>
</head>
<body>
    <header>
        <h1>Mega City Cab - Help & User Guide</h1>
    </header>

    <div>
        <a href="../index.jsp" style="margin-top: 30px" class="book-button">Back to Home</a>
    </div>

    <main>
        <div class="container">
            <section>
                <h2>🔹 Getting Started</h2>
                <p>Welcome to the Mega City Cab booking system! Follow the steps below to use the system effectively.</p>
            </section>

            <section>
                <h2>👤 Customer Guide</h2>
                <ul>
                    <li><strong>Login:</strong> Enter your username and password to log in.</li>
                    <li><strong>Book a Cab:</strong> Navigate to the "Book Now" on Cab listing, enter trip details, and click "Book a Cab".</li>
                    <li><strong>View Bookings:</strong> Go to "Dashboard" to check your trips details.</li>
                    <li><strong>Billing:</strong> Check Bill under "Your Bookings" for Bill Details and Print the bill.</li>
                    <li><strong>Help & Support:</strong> Contact support for any issues.</li>
                </ul>
            </section>

            <section>
                <h2>🛠 Admin Guide</h2>
                <ul>
                    <li><strong>Login:</strong> Use admin credentials to access the dashboard.</li>
                    <li><strong>Manage Bookings:</strong> View, update, or cancel customer bookings.</li>
                    <li><strong>Manage Cars :</strong> Add, update, or remove cars.</li>
                    <li><strong>Manage Drivers:</strong> Add, update, or remove  drivers.</li>
                    <li><strong>Billing:</strong>  Check Bill under "Manage Bookings" for Calculate and Print the bill.</li>
                </ul>
            </section>

            <section>
                <h2>📞 Contact Support</h2>
                <p>If you need further assistance, contact our support team at <strong>support@megacitycab.com</strong> or call <strong>+94 123 456 789</strong>.</p>
            </section>

        </div>

    </main>



    <footer>
        <p>&copy; 2025 Mega City Cab. All Rights Reserved.</p>
    </footer>

</body>
</html>
