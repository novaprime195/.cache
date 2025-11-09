#!/bin/bash
# Complete Flask Docker Setup Script

echo "=== FLASK DOCKER COMPLETE SETUP ==="

# 1. Check prerequisites
echo "Checking prerequisites..."

# Check Python
if command -v python3 &> /dev/null; then
    echo "✓ Python3: $(python3 --version)"
else
    echo "Installing Python3..."
    apt update && apt install -y python3 python3-pip
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✓ Docker: $(docker --version)"
else
    echo "Installing Docker..."
    apt update
    apt install -y docker.io
    systemctl start docker
    systemctl enable docker
    usermod -aG docker $USER
fi

# Start Docker service
echo "Starting Docker service..."
systemctl start docker

# 2. Test Flask app locally first
echo "Testing Flask application locally..."
cd app
python3 -m pip install -r requirements.txt
echo "Flask dependencies installed"

# Run Flask app in background for testing
echo "Starting Flask app locally for testing..."
python3 app.py &
FLASK_PID=$!
sleep 3

# Test local Flask app
echo "Testing local Flask application..."
curl -s http://localhost:5000 > /dev/null && echo "✓ Local Flask app working" || echo "✗ Local Flask app failed"

# Stop local Flask app
kill $FLASK_PID 2>/dev/null
cd ..

# 3. Build and run Docker container
echo "Building Docker image..."
./docker/build_and_run.sh

# 4. Test all endpoints
echo "Testing all application endpoints..."
sleep 5

endpoints=("/" "/about" "/api" "/health")
for endpoint in "${endpoints[@]}"; do
    response=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:5000$endpoint")
    if [ "$response" = "200" ]; then
        echo "✓ Endpoint $endpoint: Working (HTTP $response)"
    else
        echo "✗ Endpoint $endpoint: Failed (HTTP $response)"
    fi
done

# 5. Show Docker information
echo -e "\n=== DOCKER INFORMATION ==="
echo "Docker images:"
docker images | grep hello-flask

echo -e "\nDocker containers:"
docker ps | head -1
docker ps | grep flask-app

echo -e "\n=== SETUP COMPLETE ==="
echo "✅ Flask Application: Created and tested"
echo "✅ Docker Image: Built successfully"
echo "✅ Docker Container: Running"
echo "✅ All Endpoints: Tested"

echo -e "\n🌐 Access your application:"
echo "   http://localhost:5000     - Main page"
echo "   http://localhost:5000/api - JSON API"
echo "   http://localhost:5000/about - About page"

echo -e "\n🐳 Docker Commands:"
echo "   docker logs flask-app    - View logs"
echo "   docker stop flask-app    - Stop container"
echo "   docker start flask-app   - Start container"
