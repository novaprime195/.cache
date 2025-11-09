#!/bin/bash
# Simple script to build and push both images

echo "🚀 Building and Pushing Shared Memory Images"

# Set your Docker Hub username
DOCKER_USERNAME="your-username"

echo "📦 Building writer image..."
docker build -t $DOCKER_USERNAME/memory-writer ./writer

echo "📦 Building reader image..."
docker build -t $DOCKER_USERNAME/memory-reader ./reader

echo "📤 Pushing writer image..."
docker push $DOCKER_USERNAME/memory-writer

echo "📤 Pushing reader image..."
docker push $DOCKER_USERNAME/memory-reader

echo "✅ Both images pushed to Docker Hub!"
echo "📋 Images available:"
echo "   - $DOCKER_USERNAME/memory-writer"
echo "   - $DOCKER_USERNAME/memory-reader"

echo "🔧 To run from repository:"
echo "   docker volume create shared-memory"
echo "   docker run -d --name writer -v shared-memory:/shared $DOCKER_USERNAME/memory-writer"
echo "   docker run --name reader -v shared-memory:/shared $DOCKER_USERNAME/memory-reader"
