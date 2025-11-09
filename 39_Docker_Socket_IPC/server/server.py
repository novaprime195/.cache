import socket
import time

# Simple TCP Server
def start_server():
    host = '0.0.0.0'
    port = 9999
    
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server.bind((host, port))
    server.listen(5)
    
    print(f"🚀 Server listening on {host}:{port}")
    
    while True:
        try:
            client_socket, addr = server.accept()
            print(f"📡 Connection from {addr}")
            
            # Receive message from client
            message = client_socket.recv(1024).decode('utf-8')
            print(f"📨 Received: {message}")
            
            # Send response back
            response = f"Hello Client! Your message '{message}' received at {time.ctime()}"
            client_socket.send(response.encode('utf-8'))
            
            client_socket.close()
            
        except Exception as e:
            print(f"Error: {e}")

if __name__ == "__main__":
    start_server()
