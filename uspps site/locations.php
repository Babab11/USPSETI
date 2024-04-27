
<?php
include('db.php');
$query = "SELECT name, address, city, state, zipCode FROM Locations ORDER BY city";
$result = $conn->query($query);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Our Locations</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Our Locations</h1>
    <ul>
    <?php
    while ($row = $result->fetch_assoc()) {
        echo "<li>" . $row["name"] . " - " . $row["address"] . ", " . $row["city"] . ", " . $row["state"] . " " . $row["zipCode"] . "</li>";
    }
    ?>
    </ul>
          <!-- Back to Home button -->
    <div style="margin-top: 20px;">
        <a href="home.php" class="button">Back to Home</a>
    </div>
</body>
</html>
