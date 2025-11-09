#!/bin/bash

# Bug Tracker Docker Automation Script
echo "==================================="
echo "Bug Tracker Docker Setup"
echo "==================================="

# 1. Build Docker Image
echo ""
echo "Step 1: Building Docker Image..."
docker build -t bug-tracker:latest .

if [ $? -eq 0 ]; then
    echo "✅ Image built successfully!"
else
    echo "❌ Failed to build image"
    exit 1
fi

# 2. Run Docker Container
echo ""
echo "Step 2: Running Docker Container..."
docker run -d -p 5000:5000 --name bug-tracker-app bug-tracker:latest

if [ $? -eq 0 ]; then
    echo "✅ Container started successfully!"
    echo "🌐 Access the app at: http://localhost:5000"
else
    echo "❌ Failed to start container"
    exit 1
fi

# 3. Show container status
echo ""
echo "Step 3: Container Status"
docker ps | grep bug-tracker-app

# 4. Push to Docker Hub (optional)
echo ""
echo "Step 4: Push to Docker Hub (Optional)"
read -p "Enter your Docker Hub username (or press Enter to skip): " username

if [ ! -z "$username" ]; then
    echo "Logging in to Docker Hub..."
    docker login
    
    if [ $? -eq 0 ]; then
        echo "Tagging image..."
        docker tag bug-tracker:latest $username/bug-tracker:latest
        
        echo "Pushing image..."
        docker push $username/bug-tracker:latest
        
        if [ $? -eq 0 ]; then
            echo "✅ Image pushed successfully!"
            echo "🔗 Pull command: docker pull $username/bug-tracker:latest"
        else
            echo "❌ Failed to push image"
        fi
    fi
else
    echo "Skipping Docker Hub push"
fi

echo ""
echo "==================================="
echo "Setup Complete! 🎉"
echo "==================================="
echo ""
echo "Useful commands:"
echo "  View logs:    docker logs bug-tracker-app"
echo "  Stop:         docker stop bug-tracker-app"
echo "  Remove:       docker rm bug-tracker-app"
echo "  Restart:      docker restart bug-tracker-app"
echo ""
