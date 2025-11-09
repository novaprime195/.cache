<?php
// Database configuration
$servername = "db";  // Docker service name
$username = "root";
$password = "rootpass";
$database = "userdb";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die(json_encode(['success' => false, 'message' => 'Connection failed: ' . $conn->connect_error]));
}

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get form data
    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    
    // Prepare and bind
    $stmt = $conn->prepare("INSERT INTO users (name, email, phone) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $name, $email, $phone);
    
    // Execute statement
    if ($stmt->execute()) {
        echo json_encode(['success' => true, 'message' => 'Record inserted successfully!']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Error: ' . $stmt->error]);
    }
    
    $stmt->close();
}

$conn->close();
?>
