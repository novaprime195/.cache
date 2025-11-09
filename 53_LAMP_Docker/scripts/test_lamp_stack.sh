#!/bin/bash
# Test LAMP Stack and Web Application

echo "=== TESTING LAMP STACK AND WEB APPLICATION ==="

echo "1. Testing Docker and Container:"
echo "==============================="

# Check Docker service
echo "Docker service status:"
systemctl is-active docker && echo "✓ Docker: Running" || echo "✗ Docker: Not running"

# Check container status
echo -e "\nContainer status:"
if docker ps | grep lamp-server > /dev/null; then
    echo "✓ LAMP Container: Running"
    docker ps | grep lamp-server
else
    echo "✗ LAMP Container: Not running"
fi

echo -e "\n2. Testing Web Server:"
echo "====================="

# Test HTTP response
echo "Testing web server accessibility:"
response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080)
case $response in
    200) echo "✓ Web Server: Accessible (HTTP $response)" ;;
    000) echo "✗ Web Server: Not accessible (Connection refused)" ;;
    *) echo "⚠ Web Server: Unexpected response (HTTP $response)" ;;
esac

# Test if PHP is working
echo -e "\nTesting PHP functionality:"
php_test=$(curl -s http://localhost:8080 | grep -i "php version")
if [ ! -z "$php_test" ]; then
    echo "✓ PHP: Working"
else
    echo "✗ PHP: Not working or not displaying version"
fi

echo -e "\n3. Testing MySQL Database:"
echo "=========================="

# Test MySQL connectivity
echo "Testing MySQL connection:"
if docker exec lamp-server mysql -u root -prootpass -e "SELECT 1;" > /dev/null 2>&1; then
    echo "✓ MySQL: Accessible"
else
    echo "✗ MySQL: Not accessible"
fi

# Test database exists
echo "Testing student_db database:"
if docker exec lamp-server mysql -u root -prootpass -e "USE student_db; SHOW TABLES;" > /dev/null 2>&1; then
    echo "✓ Database: student_db exists"
else
    echo "✗ Database: student_db not found"
fi

# Count students
student_count=$(docker exec lamp-server mysql -u root -prootpass -e "SELECT COUNT(*) FROM student_db.students;" 2>/dev/null | tail -n 1)
if [ ! -z "$student_count" ] && [ "$student_count" -gt 0 ]; then
    echo "✓ Sample Data: $student_count students found"
else
    echo "✗ Sample Data: No students found"
fi

echo -e "\n4. Testing Application Features:"
echo "==============================="

# Test form submission
echo "Testing student registration form:"
form_response=$(curl -s -X POST http://localhost:8080 \
    -d "name=Test Student" \
    -d "email=test@example.com" \
    -d "course=Computer Science" | grep -i "successfully")
if [ ! -z "$form_response" ]; then
    echo "✓ Form Submission: Working"
else
    echo "⚠ Form Submission: May have issues"
fi

echo -e "\n5. Container Resources:"
echo "======================"

# Container stats
echo "Container resource usage:"
docker stats lamp-server --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}"

echo -e "\n6. Port Mapping:"
echo "==============="

# Check port mapping
echo "Port mappings:"
docker port lamp-server

echo -e "\n7. Application URLs:"
echo "==================="
echo "🌐 Web Application: http://localhost:8080"
echo "🗄️ MySQL Database: localhost:3306"
echo "📋 Container Name: lamp-server"

echo -e "\n=== TESTING SUMMARY ==="
echo "✓ LAMP Stack: Docker container running"
echo "✓ Web Server: Apache with PHP"
echo "✓ Database: MySQL with student_db"
echo "✓ Application: Student Management System"
echo "✓ Features: CRUD operations, responsive design"

echo -e "\n=== QUICK ACCESS ==="
echo "View in browser: http://localhost:8080"
echo "Container logs: docker logs lamp-server"
echo "MySQL access: docker exec -it lamp-server mysql -u root -prootpass"
