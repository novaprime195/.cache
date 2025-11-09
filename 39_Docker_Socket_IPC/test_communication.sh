#!/bin/bash
# Script to test socket communication

echo "🧪 Testing Socket Communication Between Docker Containers"

echo "🚀 Starting containers with docker-compose..."
docker-compose up -d socket-server

echo "⏳ Waiting for server to start..."
sleep 3

echo "📡 Testing server connectivity..."
nc -zv localhost 9999 && echo "✅ Server is accessible" || echo "❌ Server not accessible"

echo "🔌 Running client container..."
docker-compose up socket-client

echo "📊 Showing logs..."
echo "=== SERVER LOGS ==="
docker-compose logs socket-server

echo "=== CLIENT LOGS ==="
docker-compose logs socket-client

echo "✅ Test complete!"
echo "💡 Check logs above to see the communication between containers"
