<!DOCTYPE html>
<html>
<head>
    <title>Simple LAMP App</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background: #f5f5f5; }
        .container { max-width: 600px; margin: 0 auto; background: white; padding: 20px; border-radius: 10px; }
        h1 { color: #333; text-align: center; }
        .info { background: #e7f3ff; padding: 15px; border-radius: 5px; margin: 10px 0; }
        .success { background: #d4edda; color: #155724; padding: 10px; border-radius: 5px; }
        .error { background: #f8d7da; color: #721c24; padding: 10px; border-radius: 5px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🚀 Simple LAMP Stack App</h1>
        
        <div class="info">
            <h3>Server Information:</h3>
            <p><strong>Server:</strong> Apache/<?php echo apache_get_version(); ?></p>
            <p><strong>PHP Version:</strong> <?php echo phpversion(); ?></p>
            <p><strong>Current Time:</strong> <?php echo date('Y-m-d H:i:s'); ?></p>
        </div>

        <?php
        // Database connection test
        $servername = "localhost";
        $username = "webuser";
        $password = "password";
        $dbname = "simple_app";

        try {
            $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            
            // Create a simple table if it doesn't exist
            $sql = "CREATE TABLE IF NOT EXISTS visitors (
                id INT AUTO_INCREMENT PRIMARY KEY,
                visit_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            )";
            $conn->exec($sql);
            
            // Insert a new visit
            $sql = "INSERT INTO visitors (visit_time) VALUES (NOW())";
            $conn->exec($sql);
            
            // Count total visits
            $stmt = $conn->query("SELECT COUNT(*) as total_visits FROM visitors");
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            
            echo '<div class="success">';
            echo '<h3>✅ Database Connection: SUCCESS</h3>';
            echo '<p>Total page visits: ' . $result['total_visits'] . '</p>';
            echo '</div>';
            
        } catch(PDOException $e) {
            echo '<div class="error">';
            echo '<h3>❌ Database Connection: FAILED</h3>';
            echo '<p>Error: ' . $e->getMessage() . '</p>';
            echo '</div>';
        }
        ?>

        <div class="info">
            <h3>LAMP Stack Components:</h3>
            <ul>
                <li><strong>L</strong>inux - Ubuntu 22.04</li>
                <li><strong>A</strong>pache - Web Server</li>
                <li><strong>M</strong>ySQL - Database</li>
                <li><strong>P</strong>HP - Server-side scripting</li>
            </ul>
        </div>

        <div class="info">
            <p><strong>Congratulations!</strong> Your LAMP stack is running successfully!</p>
        </div>
    </div>
</body>
</html>
