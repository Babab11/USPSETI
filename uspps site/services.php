
<?php
include('db.php');
$query = "SELECT serviceType, description, price FROM Services ORDER BY price DESC";
$result = $conn->query($query);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Our Services</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Our Services</h1>
    <ul>
    <?php
    while ($row = $result->fetch_assoc()) {
        echo "<li>" . $row["serviceType"] . " - " . $row["description"] . " ($" . number_format($row["price"], 2) . ")</li>";
    }
    ?>
    </ul>
        
    <a href="home.php" class="button">Back to Home</a> <!-- Link styled as a button -->
</body>
</html>