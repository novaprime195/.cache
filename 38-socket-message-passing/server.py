#!/usr/bin/env python3
import socket
import sys

def main():
    # Create TCP socket
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    
    # Bind to all interfaces on port 5000
    server_socket.bind(('0.0.0.0', 5000))
    server_socket.listen(5)
    
    print("Server listening on port 5000...")
    
    while True:
        # Accept client connection
        client_socket, address = server_socket.accept()
        print(f"Connection from {address}")
        
        try:
            # Receive message
            data = client_socket.recv(1024).decode('utf-8')
            if data:
                print(f"Received: {data}")
                
                # Send response
                response = f"Echo: {data}"
                client_socket.send(response.encode('utf-8'))
                print(f"Sent: {response}")
        except Exception as e:
            print(f"Error: {e}")
        finally:
            client_socket.close()

if __name__ == "__main__":
    main()
