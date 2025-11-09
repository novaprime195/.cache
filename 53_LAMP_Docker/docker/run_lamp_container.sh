#!/bin/bash
# Script to run LAMP container with proper configuration

echo "=== Running LAMP Docker Container ==="

# Stop and remove existing container
docker stop lamp-server 2>/dev/null || true
docker rm lamp-server 2>/dev/null || true

# Create volumes directory
mkdir -p ./webapp-volume
mkdir -p ./mysql-data

# Run LAMP container with volume mounts
docker run -d \
    --name lamp-server \
    --restart unless-stopped \
    -p 8080:80 \
    -p 3306:3306 \
    -v "$(pwd)/webapp-volume:/app" \
    -v "$(pwd)/mysql-data:/var/lib/mysql" \
    -e MYSQL_ROOT_PASSWORD=rootpass \
    mattrayner/lamp:latest

echo "Container started successfully!"
echo "Web Server: http://localhost:8080"
echo "MySQL: localhost:3306 (root/rootpass)"

# Show container status
docker ps | head -1
docker ps | grep lamp-server
