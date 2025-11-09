<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LAMP Stack Todo App</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background: #f4f4f4;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 { color: #333; }
        input[type="text"] {
            width: 70%;
            padding: 10px;
            margin-right: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            padding: 10px 20px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover { background: #0056b3; }
        ul {
            list-style: none;
            padding: 0;
            margin-top: 20px;
        }
        li {
            padding: 10px;
            margin: 5px 0;
            background: #f8f9fa;
            border-left: 3px solid #007bff;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .delete-btn {
            background: #dc3545;
            padding: 5px 10px;
            font-size: 12px;
        }
        .delete-btn:hover { background: #c82333; }
        .info { color: #666; font-size: 14px; margin-top: 20px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>📝 Simple Todo App</h1>
        
        <?php
        // Database connection
        $host = 'localhost';
        $db = 'todoapp';
        $user = 'root';
        $pass = '';

        $conn = new mysqli($host, $user, $pass);

        // Create database if not exists
        if ($conn->query("CREATE DATABASE IF NOT EXISTS $db") === FALSE) {
            die("Error creating database: " . $conn->error);
        }

        $conn->select_db($db);

        // Create table if not exists
        $createTable = "CREATE TABLE IF NOT EXISTS todos (
            id INT AUTO_INCREMENT PRIMARY KEY,
            task VARCHAR(255) NOT NULL,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )";
        
        if ($conn->query($createTable) === FALSE) {
            die("Error creating table: " . $conn->error);
        }

        // Handle form submission (Add todo)
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['task'])) {
            $task = $conn->real_escape_string($_POST['task']);
            if (!empty($task)) {
                $conn->query("INSERT INTO todos (task) VALUES ('$task')");
            }
            header("Location: " . $_SERVER['PHP_SELF']);
            exit;
        }

        // Handle delete
        if (isset($_GET['delete'])) {
            $id = (int)$_GET['delete'];
            $conn->query("DELETE FROM todos WHERE id = $id");
            header("Location: " . $_SERVER['PHP_SELF']);
            exit;
        }

        // Fetch all todos
        $result = $conn->query("SELECT * FROM todos ORDER BY created_at DESC");
        ?>

        <form method="POST">
            <input type="text" name="task" placeholder="Enter a new task..." required>
            <button type="submit">Add</button>
        </form>

        <ul>
            <?php if ($result && $result->num_rows > 0): ?>
                <?php while($row = $result->fetch_assoc()): ?>
                    <li>
                        <span><?php echo htmlspecialchars($row['task']); ?></span>
                        <a href="?delete=<?php echo $row['id']; ?>">
                            <button class="delete-btn">Delete</button>
                        </a>
                    </li>
                <?php endwhile; ?>
            <?php else: ?>
                <li style="border-left-color: #6c757d;">No tasks yet. Add one above!</li>
            <?php endif; ?>
        </ul>

        <div class="info">
            <strong>Database:</strong> <?php echo $db; ?> | 
            <strong>Total Tasks:</strong> <?php echo $result ? $result->num_rows : 0; ?>
        </div>
    </div>
</body>
</html>
