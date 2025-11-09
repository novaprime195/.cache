#!/bin/bash
# Test Flask Application and Docker Container

echo "=== TESTING FLASK APPLICATION AND DOCKER CONTAINER ==="

echo "1. Testing Local Environment:"
echo "============================"

# Check Python and Flask
echo "Python version:"
python3 --version 2>/dev/null || echo "Python3 not found"

echo -e "\nFlask installation:"
python3 -c "import flask; print(f'Flask {flask.__version__}')" 2>/dev/null || echo "Flask not installed"

echo -e "\n2. Testing Docker Environment:"
echo "=============================="

# Check Docker
echo "Docker version:"
docker --version 2>/dev/null || echo "Docker not found"

echo -e "\nDocker service status:"
systemctl is-active docker && echo "✓ Docker service running" || echo "✗ Docker service not running"

echo -e "\n3. Testing Flask Application:"
echo "============================="

# Check if container is running
if docker ps | grep flask-app > /dev/null; then
    echo "✓ Flask container: Running"
    
    # Test all endpoints
    echo -e "\nTesting application endpoints:"
    
    endpoints=("/" "/about" "/api" "/health")
    for endpoint in "${endpoints[@]}"; do
        echo -n "Testing $endpoint: "
        response=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:5000$endpoint")
        case $response in
            200) echo "✓ Working (HTTP $response)" ;;
            000) echo "✗ Connection refused" ;;
            *) echo "⚠ Unexpected response (HTTP $response)" ;;
        esac
    done
    
    # Test JSON API response
    echo -e "\nTesting JSON API response:"
    api_response=$(curl -s http://localhost:5000/api | python3 -m json.tool 2>/dev/null)
    if [ ! -z "$api_response" ]; then
        echo "✓ JSON API: Valid response"
        echo "$api_response" | head -10
    else
        echo "✗ JSON API: Invalid response"
    fi
    
else
    echo "✗ Flask container: Not running"
fi

echo -e "\n4. Container Information:"
echo "========================"

# Container status
echo "Container status:"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" | head -1
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" | grep flask-app

# Container logs
echo -e "\nContainer logs (last 10 lines):"
docker logs --tail 10 flask-app 2>/dev/null || echo "No logs available"

# Image information
echo -e "\nDocker image information:"
docker images | head -1
docker images | grep hello-flask

echo -e "\n5. Resource Usage:"
echo "=================="

# Container stats
echo "Container resource usage:"
docker stats flask-app --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}" 2>/dev/null || echo "Container not running"

echo -e "\n6. Network Testing:"
echo "=================="

# Port testing
echo "Port accessibility:"
nc -zv localhost 5000 2>&1 && echo "✓ Port 5000: Accessible" || echo "✗ Port 5000: Not accessible"

# Curl response time
echo -e "\nResponse time test:"
curl -o /dev/null -s -w "Response time: %{time_total}s\n" http://localhost:5000/ 2>/dev/null || echo "Could not measure response time"

echo -e "\n=== TESTING SUMMARY ==="
echo "📦 Docker Image: hello-flask"
echo "🐳 Container Name: flask-app" 
echo "🌐 Application URL: http://localhost:5000"
echo "🔧 Flask Application: Hello World with multiple endpoints"
echo "📊 Features: HTML UI, JSON API, Health check"

echo -e "\n=== QUICK ACCESS COMMANDS ==="
echo "View application: curl http://localhost:5000"
echo "View API: curl http://localhost:5000/api"
echo "View logs: docker logs flask-app"
echo "Stop container: docker stop flask-app"
echo "Start container: docker start flask-app"
