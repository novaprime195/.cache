#!/bin/bash
# LAMP Stack Docker Setup Script

echo "=== LAMP STACK DOCKER SETUP ==="

# 1. Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker not found. Installing Docker..."
    # Install Docker on Ubuntu/Debian
    apt update
    apt install -y docker.io
    systemctl start docker
    systemctl enable docker
    usermod -aG docker $USER
    echo "Docker installed. You may need to log out and back in for group changes."
fi

# 2. Start Docker service
echo "Starting Docker service..."
systemctl start docker

# 3. Pull LAMP stack image
echo "Pulling LAMP stack image from Docker Hub..."
docker pull mattrayner/lamp:latest

# 4. Remove existing container if it exists
docker stop lamp-server 2>/dev/null || true
docker rm lamp-server 2>/dev/null || true

# 5. Create webapp directory in container volume
mkdir -p ./webapp-volume

# 6. Copy web application files
echo "Copying web application files..."
cp -r ./webapp/* ./webapp-volume/ 2>/dev/null || echo "No webapp files to copy yet"

# 7. Run LAMP container
echo "Running LAMP container..."
docker run -d \
    --name lamp-server \
    -p 8080:80 \
    -p 3306:3306 \
    -v "$(pwd)/webapp-volume:/app" \
    mattrayner/lamp:latest

# 8. Wait for container to start
echo "Waiting for container to start..."
sleep 10

# 9. Deploy web application
./scripts/deploy_webapp.sh

# 10. Test the setup
echo "Testing LAMP stack..."
sleep 5
curl -s http://localhost:8080 > /dev/null && echo "✓ Web server accessible" || echo "✗ Web server not accessible"

echo "=== SETUP COMPLETE ==="
echo "✓ LAMP Stack: Running on Docker"
echo "✓ Web Server: http://localhost:8080"
echo "✓ MySQL: localhost:3306"
echo "✓ Container: lamp-server"

echo -e "\nContainer Status:"
docker ps | grep lamp-server

echo -e "\nAccess your web application at: http://localhost:8080"
