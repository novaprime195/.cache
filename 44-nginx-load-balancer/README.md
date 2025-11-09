# Nginx Load Balancer with Flask and WordPress

## Overview
This project sets up an nginx load balancer that distributes traffic between a Flask application and a WordPress site.

## Components
- **Flask App**: Simple Python web application (port 5000)
- **WordPress**: CMS with MySQL database (port 80)
- **Nginx**: Load balancer (accessible on port 80)
- **MySQL**: Database for WordPress

## Quick Start

1. **Start all services**:
   ```bash
   docker-compose up -d
   ```

2. **Access the application**:
   - Open browser: `http://localhost`
   - Nginx will load balance between Flask and WordPress

3. **Stop services**:
   ```bash
   docker-compose down
   ```

## How It Works
Nginx uses round-robin load balancing to distribute requests between:
- `flask-app:5000` (Flask application)
- `wordpress-app:80` (WordPress site)

## File Structure
```
.
├── docker-compose.yml       # Container orchestration
├── nginx.conf               # Nginx load balancer config
├── flask-app/
│   ├── Dockerfile
│   ├── app.py              # Flask application
│   └── requirements.txt
└── README.md
```

## Viewing Logs
```bash
docker-compose logs -f nginx
docker-compose logs -f flask
docker-compose logs -f wordpress
```
