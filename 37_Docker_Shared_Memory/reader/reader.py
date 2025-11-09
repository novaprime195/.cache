import time
import os

# Simple shared memory reader using shared file
def read_from_shared_memory():
    shared_file = "/shared/memory_data.txt"
    
    print("📖 Reader: Starting to read data from shared memory...")
    
    while True:
        try:
            # Check if shared file exists
            if os.path.exists(shared_file):
                # Read data from shared file
                with open(shared_file, 'r') as f:
                    message = f.read().strip()
                    if message:
                        print(f"📨 Read: {message}")
                    else:
                        print("📭 Shared memory is empty")
            else:
                print("⏳ Waiting for shared memory file...")
            
            time.sleep(2)  # Read every 2 seconds
            
        except Exception as e:
            print(f"❌ Error reading: {e}")
            time.sleep(1)

if __name__ == "__main__":
    # Wait a bit for writer to start
    time.sleep(5)
    read_from_shared_memory()
