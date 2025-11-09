#!/bin/bash

# Simple Docker Compose Demo Setup
echo "=== Docker Compose Demo Setup ==="

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker first."
    exit 1
fi

# Check if Docker Compose is installed
if ! docker compose version &> /dev/null; then
    echo "Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

echo "Docker and Docker Compose are installed."
echo "Starting Docker Compose demo..."

# Start the containers
docker compose up -d

# Wait a moment for containers to start
sleep 10

# Check status
echo ""
echo "=== Container Status ==="
docker compose ps

echo ""
echo "=== Testing Web Server ==="
if curl -s http://localhost:8080 > /dev/null; then
    echo "✓ Web server is running at http://localhost:8080"
else
    echo "✗ Web server is not responding"
fi

echo ""
echo "=== Setup Complete ==="
echo "Visit http://localhost:8080 to see the web page"
echo "Run 'docker compose logs' to see container logs"
echo "Run 'docker compose down' to stop containers"
