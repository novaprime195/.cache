<?php
// PHP Info Page for LAMP Stack Testing
?>
<!DOCTYPE html>
<html>
<head>
    <title>LAMP Stack Info - Experiment 53</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .info-section { margin: 20px 0; padding: 15px; border: 1px solid #ddd; }
        h2 { color: #333; }
        pre { background: #f4f4f4; padding: 10px; overflow-x: auto; }
    </style>
</head>
<body>
    <h1>LAMP Stack Information</h1>
    
    <div class="info-section">
        <h2>Server Information</h2>
        <p><strong>Server Software:</strong> <?php echo $_SERVER['SERVER_SOFTWARE']; ?></p>
        <p><strong>Server Name:</strong> <?php echo $_SERVER['SERVER_NAME']; ?></p>
        <p><strong>Server Port:</strong> <?php echo $_SERVER['SERVER_PORT']; ?></p>
        <p><strong>Document Root:</strong> <?php echo $_SERVER['DOCUMENT_ROOT']; ?></p>
    </div>
    
    <div class="info-section">
        <h2>PHP Configuration</h2>
        <p><strong>PHP Version:</strong> <?php echo phpversion(); ?></p>
        <p><strong>PHP Extensions:</strong></p>
        <pre><?php print_r(get_loaded_extensions()); ?></pre>
    </div>
    
    <div class="info-section">
        <h2>MySQL Connection Test</h2>
        <?php
        try {
            $pdo = new PDO("mysql:host=localhost", "root", "rootpass");
            echo "<p style='color: green;'>✓ MySQL Connection: Successful</p>";
            echo "<p><strong>MySQL Version:</strong> " . $pdo->query('SELECT VERSION()')->fetchColumn() . "</p>";
            
            // Show databases
            $databases = $pdo->query('SHOW DATABASES')->fetchAll(PDO::FETCH_COLUMN);
            echo "<p><strong>Available Databases:</strong></p>";
            echo "<ul>";
            foreach($databases as $db) {
                echo "<li>$db</li>";
            }
            echo "</ul>";
            
        } catch(PDOException $e) {
            echo "<p style='color: red;'>✗ MySQL Connection Failed: " . $e->getMessage() . "</p>";
        }
        ?>
    </div>
    
    <div class="info-section">
        <h2>Environment Information</h2>
        <p><strong>Operating System:</strong> <?php echo php_uname(); ?></p>
        <p><strong>Current Time:</strong> <?php echo date('Y-m-d H:i:s'); ?></p>
        <p><strong>Container:</strong> LAMP Stack Docker</p>
    </div>
    
    <div class="info-section">
        <h2>Quick Links</h2>
        <p><a href="index.php">← Back to Student Management System</a></p>
    </div>
    
</body>
</html>
