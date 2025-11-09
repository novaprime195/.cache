#!/bin/bash

echo "=== Simple LAMP Stack Setup ==="

# Build the Docker image
echo "Building LAMP Docker image..."
docker build -t simple-lamp .

# Stop and remove existing container if running
echo "Cleaning up existing containers..."
docker stop simple-lamp-container 2>/dev/null || true
docker rm simple-lamp-container 2>/dev/null || true

# Run the container
echo "Starting LAMP container..."
docker run -d -p 8080:80 --name simple-lamp-container simple-lamp

# Wait for container to start
echo "Waiting for services to start..."
sleep 10

# Check if container is running
if docker ps | grep -q simple-lamp-container; then
    echo ""
    echo "✅ LAMP Stack is running!"
    echo ""
    echo "🌐 Access your web application:"
    echo "   Main App: http://localhost:8080"
    echo "   PHP Info: http://localhost:8080/info.php"
    echo ""
    echo "📋 Useful commands:"
    echo "   docker logs simple-lamp-container    # View logs"
    echo "   docker exec -it simple-lamp-container bash    # Enter container"
    echo "   docker stop simple-lamp-container    # Stop container"
else
    echo "❌ Failed to start LAMP container"
    echo "Check logs with: docker logs simple-lamp-container"
fi
