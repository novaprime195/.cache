#!/bin/bash
# Script to test shared memory communication

echo "🧪 Testing Shared Memory Communication Between Docker Containers"

echo "🚀 Starting containers with shared volume..."
docker-compose up -d

echo "⏳ Waiting for containers to start..."
sleep 5

echo "📊 Showing real-time logs..."
echo "=== WRITER LOGS ==="
docker-compose logs --tail=5 memory-writer

echo ""
echo "=== READER LOGS ==="
docker-compose logs --tail=5 memory-reader

echo ""
echo "📋 Container Status:"
docker-compose ps

echo ""
echo "💾 Shared Volume Info:"
docker volume inspect experiment_37_docker_shared_memory_shared-memory | grep Mountpoint

echo ""
echo "🔍 Follow logs in real-time (Ctrl+C to stop):"
echo "   docker-compose logs -f"

echo ""
echo "✅ Test setup complete!"
echo "💡 Both containers should be communicating via shared memory"
