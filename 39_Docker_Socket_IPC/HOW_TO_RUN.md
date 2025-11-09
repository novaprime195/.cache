# 🚀 Docker Socket Communication - Experiment 39

## Simple TCP Socket Communication Between Two Containers

### 1. Build and Run Both Containers
```bash
cd experiment_39_Docker_Socket_IPC

# Start server and client containers
docker-compose up --build
```

### 2. Push to Repository (Optional)
```bash
# Build individual images
docker build -t your-username/socket-server ./server
docker build -t your-username/socket-client ./client

# Push to Docker Hub
docker push your-username/socket-server
docker push your-username/socket-client
```

### 3. Run from Repository
```bash
# Pull and run server
docker run -d --name socket-server -p 9999:9999 --network socket-net your-username/socket-server

# Pull and run client
docker run --name socket-client --network socket-net your-username/socket-client
```

## What it does
- **Server Container**: Listens on port 9999 for TCP connections
- **Client Container**: Connects to server and sends messages
- **Communication**: TCP socket communication between containers
- **Network**: Docker bridge network for container communication

## Files
- `server/server.py` - TCP server application
- `server/Dockerfile` - Server container image
- `client/client.py` - TCP client application  
- `client/Dockerfile` - Client container image
- `docker-compose.yml` - Multi-container orchestration

## Simple Commands
```bash
# Run everything
docker-compose up --build

# View logs
docker-compose logs

# Stop everything
docker-compose down

# Run individually
docker run -d --name server -p 9999:9999 socket-server
docker run --name client --link server:socket-server socket-client
```

## Communication Flow
1. Server starts listening on port 9999
2. Client connects to server
3. Client sends timestamp message
4. Server receives message and sends response
5. Both containers log the communication
