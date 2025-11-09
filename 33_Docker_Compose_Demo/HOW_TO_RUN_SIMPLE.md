# Experiment 33: Simple Docker Compose Demo

## Overview
This experiment demonstrates how to use Docker Compose to run multiple Ubuntu containers together. It's a simple introduction to container orchestration.

## What You'll Learn
- Basic Docker Compose syntax
- Running multiple containers together
- Container communication
- Port mapping

## Prerequisites
- Docker installed
- Docker Compose installed

## Quick Start

### 1. Navigate to experiment directory
```bash
cd experiment_33_Docker_Compose_Demo
```

### 2. Start the containers
```bash
docker-compose up -d
```

### 3. Check running containers
```bash
docker-compose ps
```

### 4. Test the web server
```bash
curl http://localhost:8080
# Or open http://localhost:8080 in your browser
```

### 5. Check container logs
```bash
# Web container logs
docker-compose logs web

# App container logs  
docker-compose logs app

# All logs
docker-compose logs
```

### 6. Stop the containers
```bash
docker-compose down
```

## What's Running

1. **Web Container** (`simple-web`):
   - Ubuntu 22.04 with Nginx
   - Serves a simple HTML page on port 8080
   - Automatically installs and starts Nginx

2. **App Container** (`simple-app`):
   - Ubuntu 22.04 running a simple loop
   - Prints status messages every 30 seconds
   - Demonstrates a background application

## Files Structure
```
experiment_33_Docker_Compose_Demo/
├── docker-compose.yml     # Main compose file
├── scripts/
│   ├── setup.sh          # Setup script
│   ├── run.sh            # Run script
│   └── cleanup.sh        # Cleanup script
└── HOW_TO_RUN.md         # This file
```

## Useful Commands

### View container details
```bash
docker-compose ps
docker inspect simple-web
docker inspect simple-app
```

### Execute commands in containers
```bash
# Connect to web container
docker-compose exec web bash

# Connect to app container
docker-compose exec app bash
```

### Monitor resources
```bash
docker stats simple-web simple-app
```

### Restart containers
```bash
# Restart all
docker-compose restart

# Restart specific container
docker-compose restart web
```

## Troubleshooting

### Port already in use
If port 8080 is busy, change it in `docker-compose.yml`:
```yaml
ports:
  - "8081:80"  # Use port 8081 instead
```

### Container won't start
Check logs for errors:
```bash
docker-compose logs web
docker-compose logs app
```

### Clean restart
```bash
docker-compose down
docker-compose up -d
```

## Learning Exercises

1. **Modify the web page**: Edit the HTML content in the docker-compose.yml
2. **Change ports**: Map to different host ports
3. **Add environment variables**: Set custom environment variables
4. **Scale containers**: Run multiple instances of the app container

## Next Steps
- Try adding volumes for persistent data
- Explore container networking
- Learn about Docker Compose networks
- Add more services (database, cache, etc.)
