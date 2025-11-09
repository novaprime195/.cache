# Bug Tracking System - Docker Demo

A simple web-based bug tracking tool built with Flask and containerized with Docker.

## Features
- ✅ Add new bugs with title, description, and priority
- ✅ Track bug status (Open, In Progress, Closed)
- ✅ Priority levels (High, Medium, Low)
- ✅ Responsive web interface

## Quick Start

### 1. Build Docker Image
```bash
docker build -t bugtracker:latest .
```

### 2. Run Docker Container
```bash
docker run -d -p 5000:5000 --name bugtracker-app bugtracker:latest
```

### 3. Access Application
Open your browser and visit: `http://localhost:5000`

### 4. Stop Container
```bash
docker stop bugtracker-app
docker rm bugtracker-app
```

## Push to Docker Hub

### 1. Tag the Image
```bash
docker tag bugtracker:latest YOUR_DOCKERHUB_USERNAME/bugtracker:latest
```

### 2. Login to Docker Hub
```bash
docker login
```

### 3. Push the Image
```bash
docker push YOUR_DOCKERHUB_USERNAME/bugtracker:latest
```

### 4. Pull and Run from Docker Hub
```bash
docker pull YOUR_DOCKERHUB_USERNAME/bugtracker:latest
docker run -d -p 5000:5000 YOUR_DOCKERHUB_USERNAME/bugtracker:latest
```

## Usage

1. **Report a Bug**: Fill in the form with bug title, description, and priority
2. **Update Status**: Click action buttons to change bug status
3. **View All Bugs**: See complete list with details

## Tech Stack
- **Backend**: Flask (Python)
- **Frontend**: HTML/CSS
- **Storage**: JSON file
- **Container**: Docker

## Files
- `app.py` - Flask application
- `templates/index.html` - Web interface
- `requirements.txt` - Python dependencies
- `Dockerfile` - Docker configuration

---
**Note**: Replace `YOUR_DOCKERHUB_USERNAME` with your actual Docker Hub username.
