#!/bin/bash
# Build and Run Flask Docker Container

echo "=== BUILDING AND RUNNING FLASK DOCKER CONTAINER ==="

# Set variables
IMAGE_NAME="hello-flask"
CONTAINER_NAME="flask-app"
PORT=5000

# Stop and remove existing container
echo "Cleaning up existing containers..."
docker stop $CONTAINER_NAME 2>/dev/null || true
docker rm $CONTAINER_NAME 2>/dev/null || true

# Build Docker image
echo "Building Docker image: $IMAGE_NAME"
docker build -t $IMAGE_NAME -f ./docker/Dockerfile .

if [ $? -eq 0 ]; then
    echo "✓ Docker image built successfully"
else
    echo "✗ Docker image build failed"
    exit 1
fi

# Run Docker container
echo "Running Docker container: $CONTAINER_NAME"
docker run -d \
    --name $CONTAINER_NAME \
    -p $PORT:$PORT \
    --restart unless-stopped \
    $IMAGE_NAME

if [ $? -eq 0 ]; then
    echo "✓ Docker container started successfully"
else
    echo "✗ Docker container failed to start"
    exit 1
fi

# Wait a moment for container to start
sleep 3

# Test the application
echo "Testing Flask application..."
response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:$PORT)
if [ "$response" = "200" ]; then
    echo "✓ Flask application is running and accessible"
else
    echo "✗ Flask application is not accessible (HTTP $response)"
fi

echo "=== CONTAINER SETUP COMPLETE ==="
echo "🌐 Application URL: http://localhost:$PORT"
echo "🐳 Container Name: $CONTAINER_NAME"
echo "📦 Image Name: $IMAGE_NAME"

# Show container status
echo -e "\nContainer Status:"
docker ps | head -1
docker ps | grep $CONTAINER_NAME

echo -e "\nContainer Logs (last 10 lines):"
docker logs --tail 10 $CONTAINER_NAME
