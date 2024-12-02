<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LOGIN || Express Laundry System!</title>
    <link rel="shortcut icon" href="assets/img/washing-clothes.gif" type="image/gif">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> <!-- FontAwesome link -->
    <style>
        /* Set the body and html to full height */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        /* Background Image Styling */
        body {
            background-image: url('assets/img/washing.jpg'); /* Your background image */
            background-size: cover; /* Ensure it covers the full page */
            background-position: center center; /* Centers the image */
            background-attachment: fixed; /* Keep the image fixed when scrolling */
            background-repeat: no-repeat; /* Prevent repetition of the image */
        }

        /* Style for the card and form content */
        .login-container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%); /* Center the content */
            width: 100%;
            max-width: 400px; /* Set max-width for the login card */
            padding: 60px;
            background-color: white; /* Add slight transparency */
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Shadow for the card */
        }

        /* Dark Mode Styles */
        body[data-theme="dark"] {
            background-color: #121212;
            color: white;
        }

        /* Centering the text and ensuring responsive styles */
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-control {
            margin-bottom: 10px;
        }

        /* Optional: Dark Mode Toggle Button */
        .dark-mode-toggle {
            position: fixed;
            top: 15px;
            right: 15px;
            background: #224361;
            border: none;
            border-radius: 50%;
            padding: 15px;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            z-index: 9999;
        }

        .dark-mode-toggle i {
            color: white;
        }

    </style>
</head>

<body data-theme="light">
    <!-- Dark Mode Toggle Button -->
    <button class="dark-mode-toggle" id="darkModeToggle">
        <i class="fas fa-sun"></i>
    </button>

    <div class="login-container">
        <h2>Log In</h2>
        <form action="functions/login.php" method="post">
        <div class="bs-icon-xl bs-icon-circle my-4 d-flex justify-content-center align-items-center">
                                            <img src="assets/img/laundry-cat.gif" alt="User Avatar" class="img-circle"
                                                style="width: 150px; height: 150px; object-fit: cover; border-radius: 50%;">
                                        </div>
            <input class="form-control form-control-lg" type="text" name="username" placeholder="Username" required>
            <input class="form-control form-control-lg" type="password" name="password" placeholder="Password" required>
            <div class="form-check">
                <input class="form-check-input" name="remember" type="checkbox">
                <label class="form-check-label" for="remember">Remember me</label>
            </div>
            <button class="btn btn-primary d-block w-100" type="submit">Login</button>
        </form>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const darkModeToggle = document.getElementById('darkModeToggle');
            const body = document.body;

            // Check for the saved theme and set it
            const savedTheme = localStorage.getItem('theme') || 'light';
            body.setAttribute('data-theme', savedTheme);

            // Toggle between dark and light mode
            darkModeToggle.addEventListener('click', function() {
                const currentTheme = body.getAttribute('data-theme');
                const newTheme = currentTheme === 'dark' ? 'light' : 'dark';

                body.setAttribute('data-theme', newTheme);
                darkModeToggle.innerHTML = newTheme === 'dark' ? '<i class="fas fa-moon"></i>' : '<i class="fas fa-sun"></i>';

                localStorage.setItem('theme', newTheme);
            });
        });
    </script>
</body>
</html>
