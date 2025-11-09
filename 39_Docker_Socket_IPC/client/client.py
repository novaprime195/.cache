import socket
import time
import sys

# Simple TCP Client
def start_client():
    host = 'socket-server'  # Docker service name
    port = 9999
    
    print(f"🔌 Connecting to server at {host}:{port}")
    
    try:
        client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client.connect((host, port))
        
        # Send message to server
        message = f"Hello from Client at {time.ctime()}"
        print(f"📤 Sending: {message}")
        client.send(message.encode('utf-8'))
        
        # Receive response from server
        response = client.recv(1024).decode('utf-8')
        print(f"📨 Server Response: {response}")
        
        client.close()
        print("✅ Communication successful!")
        
    except Exception as e:
        print(f"❌ Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    # Wait a bit for server to start
    time.sleep(2)
    start_client()
