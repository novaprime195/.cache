import time
import os

# Simple shared memory writer using shared file
def write_to_shared_memory():
    shared_file = "/shared/memory_data.txt"
    counter = 0
    
    print("📝 Writer: Starting to write data to shared memory...")
    
    while True:
        try:
            # Write data to shared file
            with open(shared_file, 'w') as f:
                message = f"Hello from Writer! Counter: {counter} | Time: {time.ctime()}"
                f.write(message)
                print(f"✍️  Written: {message}")
            
            counter += 1
            time.sleep(3)  # Write every 3 seconds
            
        except Exception as e:
            print(f"❌ Error writing: {e}")
            time.sleep(1)

if __name__ == "__main__":
    # Ensure shared directory exists
    os.makedirs("/shared", exist_ok=True)
    write_to_shared_memory()
