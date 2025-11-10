# 38. Create two applications/socket/IPC  in two different docker containers. Push those applications and run to show the communications between two dockers.
# Ex Message passing between two container

# server.py
import socket

HOST = '0.0.0.0'  # Listen on all interfaces
PORT = 5000

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen()
    print("Server listening on port", PORT)
    conn, addr = s.accept()
    with conn:
        print("Connected by", addr)
        conn.sendall(b"Hello from Server via Socket!")

# client.py
import socket
import time

time.sleep(3)  # Wait for server to start
HOST = 'server'  # We'll use the container name as hostname
PORT = 5000

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect((HOST, PORT))
    data = s.recv(1024)
    print("Client received:", data.decode())

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

docker network create mynetwork
docker build -t pyserver -f Dockerfile.server .
docker build -t pyclient -f Dockerfile.client .
docker run -d --name server --network mynetwork pyserver
docker run --name client --network mynetwork pyclient
