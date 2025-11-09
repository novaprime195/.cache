<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management System - LAMP Stack Demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            border: none;
            border-radius: 15px;
        }
        .card-header {
            background: linear-gradient(45deg, #667eea, #764ba2);
            color: white;
            border-radius: 15px 15px 0 0;
        }
        .btn-custom {
            background: linear-gradient(45deg, #667eea, #764ba2);
            border: none;
            color: white;
        }
        .btn-custom:hover {
            background: linear-gradient(45deg, #764ba2, #667eea);
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h1 class="text-center mb-0">🎓 Student Management System</h1>
                        <p class="text-center mb-0">LAMP Stack Docker Demo</p>
                    </div>
                    <div class="card-body">
                        
                        <?php
                        // Database configuration
                        $servername = "localhost";
                        $username = "root";
                        $password = "rootpass";
                        $dbname = "student_db";

                        try {
                            // Create connection
                            $conn = new PDO("mysql:host=$servername", $username, $password);
                            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                            
                            // Create database if not exists
                            $conn->exec("CREATE DATABASE IF NOT EXISTS $dbname");
                            $conn->exec("USE $dbname");
                            
                            // Create table if not exists
                            $sql = "CREATE TABLE IF NOT EXISTS students (
                                id INT AUTO_INCREMENT PRIMARY KEY,
                                name VARCHAR(100) NOT NULL,
                                email VARCHAR(100) NOT NULL,
                                course VARCHAR(100) NOT NULL,
                                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                            )";
                            $conn->exec($sql);
                            
                            // Insert sample data if table is empty
                            $count = $conn->query("SELECT COUNT(*) FROM students")->fetchColumn();
                            if ($count == 0) {
                                $sampleData = [
                                    ["John Doe", "john@example.com", "Computer Science"],
                                    ["Jane Smith", "jane@example.com", "Information Technology"],
                                    ["Mike Johnson", "mike@example.com", "Software Engineering"]
                                ];
                                
                                $stmt = $conn->prepare("INSERT INTO students (name, email, course) VALUES (?, ?, ?)");
                                foreach ($sampleData as $student) {
                                    $stmt->execute($student);
                                }
                            }
                            
                        } catch(PDOException $e) {
                            echo '<div class="alert alert-danger">Database Error: ' . $e->getMessage() . '</div>';
                        }

                        // Handle form submission
                        if ($_POST && isset($_POST['name']) && isset($_POST['email']) && isset($_POST['course'])) {
                            try {
                                $stmt = $conn->prepare("INSERT INTO students (name, email, course) VALUES (?, ?, ?)");
                                $stmt->execute([$_POST['name'], $_POST['email'], $_POST['course']]);
                                echo '<div class="alert alert-success">Student added successfully!</div>';
                            } catch(PDOException $e) {
                                echo '<div class="alert alert-danger">Error adding student: ' . $e->getMessage() . '</div>';
                            }
                        }
                        ?>
                        
                        <!-- Add Student Form -->
                        <div class="row mb-4">
                            <div class="col-md-6">
                                <h3>Add New Student</h3>
                                <form method="POST" class="needs-validation" novalidate>
                                    <div class="mb-3">
                                        <label for="name" class="form-label">Full Name</label>
                                        <input type="text" class="form-control" id="name" name="name" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="email" name="email" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="course" class="form-label">Course</label>
                                        <select class="form-control" id="course" name="course" required>
                                            <option value="">Select Course</option>
                                            <option value="Computer Science">Computer Science</option>
                                            <option value="Information Technology">Information Technology</option>
                                            <option value="Software Engineering">Software Engineering</option>
                                            <option value="Data Science">Data Science</option>
                                            <option value="Cybersecurity">Cybersecurity</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-custom">Add Student</button>
                                </form>
                            </div>
                            
                            <!-- System Information -->
                            <div class="col-md-6">
                                <h3>System Information</h3>
                                <div class="card bg-light">
                                    <div class="card-body">
                                        <p><strong>PHP Version:</strong> <?php echo phpversion(); ?></p>
                                        <p><strong>Server:</strong> <?php echo $_SERVER['SERVER_SOFTWARE']; ?></p>
                                        <p><strong>MySQL Version:</strong> <?php echo $conn->query('SELECT VERSION()')->fetchColumn(); ?></p>
                                        <p><strong>Current Time:</strong> <?php echo date('Y-m-d H:i:s'); ?></p>
                                        <p><strong>Container:</strong> LAMP Stack Docker</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Students List -->
                        <div class="row">
                            <div class="col-md-12">
                                <h3>Students List</h3>
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover">
                                        <thead class="table-dark">
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Course</th>
                                                <th>Added Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            try {
                                                $stmt = $conn->query("SELECT * FROM students ORDER BY id DESC");
                                                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                                                    echo "<tr>";
                                                    echo "<td>" . $row['id'] . "</td>";
                                                    echo "<td>" . htmlspecialchars($row['name']) . "</td>";
                                                    echo "<td>" . htmlspecialchars($row['email']) . "</td>";
                                                    echo "<td>" . htmlspecialchars($row['course']) . "</td>";
                                                    echo "<td>" . date('Y-m-d H:i', strtotime($row['created_at'])) . "</td>";
                                                    echo "</tr>";
                                                }
                                            } catch(PDOException $e) {
                                                echo '<tr><td colspan="5" class="text-center text-danger">Error loading students: ' . $e->getMessage() . '</td></tr>';
                                            }
                                            ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="card-footer text-center bg-light">
                        <small class="text-muted">LAMP Stack Demo - Experiment 53 - Docker Container</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
