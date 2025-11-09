#!/bin/bash
# Simple script to build and push both images

echo "🚀 Building and Pushing Socket Communication Images"

# Set your Docker Hub username
DOCKER_USERNAME="your-username"

echo "📦 Building server image..."
docker build -t $DOCKER_USERNAME/socket-server ./server

echo "📦 Building client image..."
docker build -t $DOCKER_USERNAME/socket-client ./client

echo "📤 Pushing server image..."
docker push $DOCKER_USERNAME/socket-server

echo "📤 Pushing client image..."
docker push $DOCKER_USERNAME/socket-client

echo "✅ Both images pushed to Docker Hub!"
echo "📋 Images available:"
echo "   - $DOCKER_USERNAME/socket-server"
echo "   - $DOCKER_USERNAME/socket-client"
