# Experiment 31: Simple LAMP Stack Container

## Overview
Create and run a simple LAMP (Linux, Apache, MySQL, PHP) stack in a Docker container with a basic web application.

## What You'll Learn
- How to containerize a LAMP stack
- Basic web application with database
- Docker container management

## Prerequisites
- Docker installed and running

## Quick Start

### Option 1: One-Command Setup
```bash
cd experiment_31_Simple_LAMP
./run.sh
```

### Option 2: Manual Steps
```bash
cd experiment_31_Simple_LAMP

# Build the image
docker build -t simple-lamp .

# Run the container
docker run -d -p 8080:80 --name simple-lamp-container simple-lamp

# Check if running
docker ps
```

## Access Your Application

1. **Main Web App**: http://localhost:8080
2. **PHP Info Page**: http://localhost:8080/info.php

## What's Included

### LAMP Stack Components
- **Linux**: Ubuntu 22.04
- **Apache**: Web server on port 80
- **MySQL**: Database server
- **PHP**: Server-side scripting

### Web Application Features
- Server information display
- Database connection test
- Visit counter (stores data in MySQL)
- Responsive design

## File Structure
```
experiment_31_Simple_LAMP/
├── Dockerfile          # Container configuration
├── run.sh              # Setup and run script
├── webapp/
│   ├── index.php       # Main application
│   └── info.php        # PHP information
└── HOW_TO_RUN.md       # This guide
```

## Useful Commands

```bash
# View container logs
docker logs simple-lamp-container

# Enter the container
docker exec -it simple-lamp-container bash

# Check MySQL inside container
docker exec -it simple-lamp-container mysql -u webuser -p

# Stop the container
docker stop simple-lamp-container

# Remove the container
docker rm simple-lamp-container

# Remove the image
docker rmi simple-lamp
```

## Testing the Application

1. Visit http://localhost:8080
2. You should see:
   - Server information (Apache version, PHP version)
   - Database connection status
   - Visit counter that increases on each page refresh
   - LAMP stack component information

3. Visit http://localhost:8080/info.php to see detailed PHP configuration

## Troubleshooting

### Container won't start
```bash
# Check logs
docker logs simple-lamp-container

# Try rebuilding
docker build -t simple-lamp . --no-cache
```

### Port already in use
Change the port in the run command:
```bash
docker run -d -p 8081:80 --name simple-lamp-container simple-lamp
```

### Database connection issues
The MySQL service takes a few seconds to start. Wait and refresh the page.

## Customizing the Application

1. Edit `webapp/index.php` to modify the web application
2. Add new PHP files in the `webapp/` directory
3. Rebuild and run: `./run.sh`

## Clean Up
```bash
# Stop and remove everything
docker stop simple-lamp-container
docker rm simple-lamp-container
docker rmi simple-lamp
```

That's it! You now have a working LAMP stack in Docker with a simple web application.
