# Docker Inter-Container Communication Demo

Simple socket-based communication between two Docker containers using Python.

## Overview

- **Server Container**: Listens on port 5000 and echoes received messages
- **Client Container**: Connects to server and sends 5 test messages
- **Communication**: TCP sockets over Docker bridge network

## Files

- `server.py` - TCP server application
- `client.py` - TCP client application
- `Dockerfile.server` - Server container image
- `Dockerfile.client` - Client container image
- `docker-compose.yml` - Multi-container orchestration

## Quick Start

### 1. Build and Run

```bash
docker-compose up --build
```

### 2. View Logs

Watch both containers communicate in real-time:
```bash
# Server logs
docker logs -f socket-server

# Client logs
docker logs -f socket-client
```

### 3. Stop Containers

```bash
docker-compose down
```

## How It Works

1. Docker Compose creates a bridge network (`app-network`)
2. Server container starts and listens on port 5000
3. Client container connects to server using service name resolution
4. Client sends 5 messages, server echoes each one back
5. Client finishes and exits

## Manual Build (Alternative)

```bash
# Build images
docker build -f Dockerfile.server -t socket-server .
docker build -f Dockerfile.client -t socket-client .

# Create network
docker network create app-network

# Run server
docker run -d --name server --network app-network -p 5000:5000 socket-server

# Run client
docker run --name client --network app-network socket-client

# View logs
docker logs server
docker logs client

# Cleanup
docker rm -f server client
docker network rm app-network
```

## Expected Output

**Server:**
```
Server listening on port 5000...
Connection from ('172.x.x.x', xxxxx)
Received: Hello from client! Message #1
Sent: Echo: Hello from client! Message #1
...
```

**Client:**
```
Connecting to server at server:5000...
Sending: Hello from client! Message #1
Received: Echo: Hello from client! Message #1
...
Client finished sending messages.
```

## Key Concepts

- **Service Discovery**: Client uses service name `server` instead of IP
- **Bridge Network**: Containers communicate over isolated Docker network
- **Socket Programming**: Standard TCP/IP communication
- **Docker Compose**: Simplified multi-container management
