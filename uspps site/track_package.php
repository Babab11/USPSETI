
<?php
include('db.php');
$trackingNumber = $status = $deliveryDate = "";

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['trackingNumber'])) {
    $trackingNumber = mysqli_real_escape_string($conn, $_POST['trackingNumber']);
    $stmt = $conn->prepare("SELECT status, estimatedDelivery FROM Packages WHERE trackingNumber = ?");
    $stmt->bind_param("s", $trackingNumber);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $status = $row['status'];
        $deliveryDate = $row['estimatedDelivery'];
    } else {
        $status = "No package found with that tracking number.";
    }
    $stmt->close();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Track Package</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Track Your Package</h1>
    <form method="post" action="">
        <label for="trackingNumber">Tracking Number:</label>
        <input type="text" id="trackingNumber" name="trackingNumber" required>
        <button type="submit">Track</button>
    </form>
    <?php if ($status) echo "<p>Status: $status</p>"; ?>
    <?php if ($deliveryDate) echo "<p>Estimated Delivery Date: $deliveryDate</p>"; ?>
           <!-- Back to Home button -->
    <div style="margin-top: 20px;">
        <a href="home.php" class="button">Back to Home</a>
    </div>
</body>
</html>

