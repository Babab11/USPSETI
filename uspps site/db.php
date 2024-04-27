<?php
$servername = "fdb1034.awardspace.net";
$username = "4477072_uspps"; // Change to your database username
$password = "Fufumaster17@"; // Change to your database password
$database = "4477072_uspps"; // Change to your database name

// Create a connection using MySQLi object-oriented method
$conn = new mysqli($servername, $username, $password, $database);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Do not close the connection here
?>
