# 🚀 Docker Shared Memory Communication - Experiment 37

## Simple Shared Memory Communication Between Two Containers

### 1. Build and Run Both Containers
```bash
cd experiment_37_Docker_Shared_Memory

# Start writer and reader containers with shared volume
docker-compose up --build
```

### 2. Push to Repository
```bash
# Build individual images
docker build -t your-username/memory-writer ./writer
docker build -t your-username/memory-reader ./reader

# Push to Docker Hub
docker push your-username/memory-writer
docker push your-username/memory-reader
```

### 3. Run from Repository
```bash
# Create shared volume
docker volume create shared-memory

# Run writer container
docker run -d --name memory-writer -v shared-memory:/shared your-username/memory-writer

# Run reader container
docker run --name memory-reader -v shared-memory:/shared your-username/memory-reader
```

## What it does
- **Writer Container**: Writes data to shared memory file every 3 seconds
- **Reader Container**: Reads data from shared memory file every 2 seconds
- **Shared Volume**: Docker volume mounted at `/shared` in both containers
- **Communication**: File-based shared memory between containers

## Files
- `writer/writer.py` - Memory writer application
- `writer/Dockerfile` - Writer container image
- `reader/reader.py` - Memory reader application  
- `reader/Dockerfile` - Reader container image
- `docker-compose.yml` - Multi-container orchestration with shared volume

## Simple Commands
```bash
# Run everything
docker-compose up --build

# View logs separately
docker-compose logs memory-writer
docker-compose logs memory-reader

# Stop everything
docker-compose down

# Clean up volumes
docker-compose down -v
```

## Communication Flow
1. Writer starts and creates shared memory file
2. Writer continuously writes timestamped messages
3. Reader starts and monitors shared memory file
4. Reader continuously reads and displays messages
5. Both containers log their activities

## Shared Memory Implementation
- Uses Docker volumes for shared storage
- Writer creates `/shared/memory_data.txt`
- Reader monitors the same file
- Simple file-based IPC mechanism
