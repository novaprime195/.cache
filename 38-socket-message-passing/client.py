#!/usr/bin/env python3
import socket
import time
import sys

def main():
    server_host = 'server'  # Docker service name
    server_port = 5000
    
    print(f"Connecting to server at {server_host}:{server_port}...")
    
    # Wait a bit for server to be ready
    time.sleep(2)
    
    # Send multiple messages
    for i in range(5):
        try:
            # Create socket for each message
            client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            client_socket.connect((server_host, server_port))
            
            # Send message
            message = f"Hello from client! Message #{i+1}"
            print(f"Sending: {message}")
            client_socket.send(message.encode('utf-8'))
            
            # Receive response
            response = client_socket.recv(1024).decode('utf-8')
            print(f"Received: {response}")
            
            client_socket.close()
            time.sleep(1)
            
        except Exception as e:
            print(f"Error: {e}")
            time.sleep(2)
    
    print("Client finished sending messages.")

if __name__ == "__main__":
    main()
