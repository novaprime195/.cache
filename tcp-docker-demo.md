# 39. Create two applications/socket/IPC  in two different Docker containers. Push those applications and run to show the communications between two dockers.
# Ex. TCP/UDP Socket communication between two container

<!-- Folder structure -->
tcp-docker-demo/
├── server.py
├── client.py
├── Dockerfile.server
└── Dockerfile.client


# server.py
import socket

HOST = '0.0.0.0'  # Listen on all available interfaces inside container
PORT = 5000

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen()
    print(f"[SERVER] Listening on port {PORT}...")
    conn, addr = s.accept()
    with conn:
        print(f"[SERVER] Connected by {addr}")
        conn.sendall(b"Hello from TCP Server inside Docker!")

# client.py
import socket
import time

time.sleep(3)  # Wait for server to start up
HOST = 'server'  # Docker resolves this via container name
PORT = 5000

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect((HOST, PORT))
    data = s.recv(1024)
    print("[CLIENT] Received message:", data.decode())


# Dockerfile.server
FROM python:3.9-slim
WORKDIR /app
COPY server.py .
CMD ["python", "server.py"]


# Dockerfile.client
FROM python:3.9-slim
WORKDIR /app
COPY client.py .
CMD ["python", "client.py"]

docker network create tcpnet

docker run -d --name server --network tcpnet tcp-server

docker run --name client --network tcpnet tcp-client


# if error occurs: at docker run -d --name server --network tcpnet tcp-server
docker rm -f server

<!-- Verify Communication -->
docker logs server
docker logs client

