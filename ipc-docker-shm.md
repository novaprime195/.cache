#     37. Create two applications/socket/IPC in two different docker containers. Push those applications and run to show the communications between two dockers.
# Ex. Shared memory between two container

# writer.py
# writer.py
from multiprocessing import shared_memory
import time

data = b"Hello from writer container!"
shm = shared_memory.SharedMemory(name="sharedmem", create=True, size=1024)
shm.buf[:len(data)] = data

print("Writer wrote to shared memory.")
while True:
    time.sleep(1)


# reader.py
from multiprocessing import shared_memory
import time

time.sleep(3)  # wait for writer
existing_shm = shared_memory.SharedMemory(name="sharedmem")
data = bytes(existing_shm.buf[:30]).decode()
print("Reader read from shared memory:", data)

# Dockerfile.writer
FROM python:3.9-slim
WORKDIR /app
COPY writer.py .
CMD ["python", "writer.py"]

# Dockerfile.reader
FROM python:3.9-slim
WORKDIR /app
COPY reader.py .
CMD ["python", "reader.py"]

docker build -t shm-writer -f Dockerfile.writer .
docker build -t shm-reader -f Dockerfile.reader .

docker run -d --name writer --ipc=shareable shm-writer
docker run --name reader --ipc=container:writer shm-reader
