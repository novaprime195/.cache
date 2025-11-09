# Experiment 29: MediaWiki LAMP Stack Container

## Overview
Simple LAMP stack container running MediaWiki on port 8080.

## What You Get
- **Linux**: Ubuntu base
- **Apache**: Web server 
- **MySQL/MariaDB**: Database
- **PHP**: Server-side scripting
- **MediaWiki**: Wiki software

## Quick Start

### 1. Navigate to directory
```bash
cd experiment_29_MediaWiki_LAMP
```

### 2. Run the container
```bash
chmod +x run.sh
./run.sh
```

### 3. Access MediaWiki
- Wait 30 seconds for services to start
- Open browser: http://localhost:8080
- Follow MediaWiki setup wizard

## Setup MediaWiki

When you visit http://localhost:8080, you'll see MediaWiki setup:

1. **Language**: Choose your language
2. **Database**: 
   - Database type: MySQL/MariaDB
   - Database host: localhost
   - Database name: mediawiki
   - Username: wiki
   - Password: password
3. **Continue** through the setup
4. **Download** the LocalSettings.php file when prompted

## Container Management

```bash
# Check status
docker ps

# View logs
docker logs mediawiki-container

# Stop container
docker stop mediawiki-container

# Remove container
docker rm mediawiki-container

# Remove image
docker rmi mediawiki-lamp
```

## Files
- `Dockerfile`: Container definition
- `run.sh`: Build and run script
- `HOW_TO_RUN.md`: This guide

That's it! Simple MediaWiki LAMP stack ready to use.
