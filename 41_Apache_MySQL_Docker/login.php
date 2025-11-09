<?php
// Simple login with MySQL
$host = 'mysql-db';
$user = 'root';
$pass = 'rootpass';
$db = 'logindb';

try {
    // Connect to MySQL
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    
    if ($_POST) {
        $username = $_POST['username'];
        $password = $_POST['password'];
        
        // Simple check (in real app, use password hashing)
        $stmt = $pdo->prepare("SELECT * FROM users WHERE username = ? AND password = ?");
        $stmt->execute([$username, $password]);
        
        if ($stmt->rowCount() > 0) {
            echo "<h1 style='color: green; text-align: center;'>✓ Login Successful!</h1>";
            echo "<p style='text-align: center;'>Welcome, $username!</p>";
            echo "<p style='text-align: center;'><a href='index.html'>← Back to Login</a></p>";
        } else {
            echo "<h1 style='color: red; text-align: center;'>✗ Login Failed!</h1>";
            echo "<p style='text-align: center;'><a href='index.html'>← Try Again</a></p>";
        }
    }
} catch(PDOException $e) {
    echo "Database Error: " . $e->getMessage();
}
?>
