#!/bin/bash
# Deploy Web Application to LAMP Container

echo "=== DEPLOYING WEB APPLICATION ==="

# 1. Ensure container is running
if ! docker ps | grep lamp-server > /dev/null; then
    echo "Starting LAMP container..."
    ./docker/run_lamp_container.sh
    sleep 10
fi

# 2. Copy web application files to container
echo "Copying web application files..."
mkdir -p ./webapp-volume
cp -r ./webapp/* ./webapp-volume/

# 3. Set proper permissions
echo "Setting file permissions..."
docker exec lamp-server chmod -R 755 /app
docker exec lamp-server chown -R www-data:www-data /app

# 4. Create MySQL database and user
echo "Setting up MySQL database..."
docker exec lamp-server mysql -u root -prootpass -e "
CREATE DATABASE IF NOT EXISTS student_db;
CREATE USER IF NOT EXISTS 'webapp'@'%' IDENTIFIED BY 'webapp123';
GRANT ALL PRIVILEGES ON student_db.* TO 'webapp'@'%';
FLUSH PRIVILEGES;
"

# 5. Test database connectivity
echo "Testing database connection..."
docker exec lamp-server mysql -u root -prootpass -e "SHOW DATABASES;" | grep student_db > /dev/null && echo "✓ Database created" || echo "✗ Database creation failed"

# 6. Test web server
echo "Testing web server..."
sleep 3
response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080)
if [ "$response" = "200" ]; then
    echo "✓ Web application deployed successfully"
else
    echo "✗ Web application deployment failed (HTTP $response)"
fi

echo "=== DEPLOYMENT COMPLETE ==="
echo "✓ Web Application: http://localhost:8080"
echo "✓ Database: student_db"
echo "✓ Container: lamp-server"

# 7. Show container logs
echo -e "\nContainer Logs (last 10 lines):"
docker logs --tail 10 lamp-server
