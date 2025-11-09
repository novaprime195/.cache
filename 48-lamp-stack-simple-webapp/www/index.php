<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LAMP Stack App</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            padding: 40px;
            max-width: 600px;
            width: 100%;
        }
        h1 {
            color: #667eea;
            margin-bottom: 20px;
            text-align: center;
        }
        .info-box {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin: 15px 0;
        }
        .info-box h3 {
            color: #764ba2;
            margin-bottom: 10px;
        }
        .status {
            display: inline-block;
            padding: 5px 15px;
            border-radius: 20px;
            font-weight: bold;
            margin: 5px 0;
        }
        .success { background: #d4edda; color: #155724; }
        .error { background: #f8d7da; color: #721c24; }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        td {
            padding: 8px;
            border-bottom: 1px solid #dee2e6;
        }
        td:first-child {
            font-weight: bold;
            color: #495057;
        }
        .links {
            margin-top: 20px;
            text-align: center;
        }
        .links a {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            background: #667eea;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s;
        }
        .links a:hover {
            background: #764ba2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🚀 LAMP Stack Application</h1>
        
        <div class="info-box">
            <h3>📊 System Information</h3>
            <table>
                <tr>
                    <td>PHP Version:</td>
                    <td><?php echo phpversion(); ?></td>
                </tr>
                <tr>
                    <td>Server Software:</td>
                    <td><?php echo $_SERVER['SERVER_SOFTWARE']; ?></td>
                </tr>
                <tr>
                    <td>Document Root:</td>
                    <td><?php echo $_SERVER['DOCUMENT_ROOT']; ?></td>
                </tr>
                <tr>
                    <td>Server Time:</td>
                    <td><?php echo date('Y-m-d H:i:s'); ?></td>
                </tr>
            </table>
        </div>

        <div class="info-box">
            <h3>🗄️ Database Connection</h3>
            <?php
            $host = 'db';
            $dbname = 'appdb';
            $username = 'appuser';
            $password = 'apppass';

            try {
                $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                
                echo '<span class="status success">✓ Connected to MySQL</span>';
                
                $version = $pdo->query('SELECT VERSION()')->fetchColumn();
                echo '<table>';
                echo '<tr><td>MySQL Version:</td><td>' . $version . '</td></tr>';
                echo '<tr><td>Database:</td><td>' . $dbname . '</td></tr>';
                echo '</table>';
                
            } catch(PDOException $e) {
                echo '<span class="status error">✗ Connection Failed</span>';
                echo '<p style="color: #721c24; margin-top: 10px;">Error: ' . $e->getMessage() . '</p>';
            }
            ?>
        </div>

        <div class="links">
            <a href="users.php">👥 User Demo</a>
            <a href="http://localhost:8081" target="_blank">🔧 phpMyAdmin</a>
        </div>
    </div>
</body>
</html>
