<?php
// Include the database connection file
include('db.php'); // Ensure db.php properly handles the DB connection lifecycle
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Postal Service Home</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Welcome to Our Postal Service</h1>
    <nav>
        <ul>
            <!-- Ensure that the href attributes point to the correct paths for your PHP files -->
            <li><a href="login.php">Login</a></li>
            <li><a href="track_package.php">Track a Package</a></li>
            <li><a href="services.php">View Services</a></li>
            <li><a href="locations.php">Our Locations</a></li>
        </ul>
    </nav>
</body>
</html>
