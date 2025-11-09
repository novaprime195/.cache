# Bug Tracking System - Docker Lab 🐛

A simple, lightweight bug tracking tool built with Flask and containerized with Docker.

## Features
- ✅ Create, view, update, and delete bug reports
- ✅ Priority levels (Low, Medium, High, Critical)
- ✅ Status tracking (Open, In Progress, Resolved, Closed)
- ✅ Clean, modern UI
- ✅ SQLite database for persistence

## Quick Start (3 Commands)

### 1. Build Docker Image
```bash
docker build -t bug-tracker:latest .
```

### 2. Run Container
```bash
docker run -d -p 5000:5000 --name bug-tracker-app bug-tracker:latest
```

### 3. Access Application
Open browser: **http://localhost:5000**

---

## Push to Docker Hub (Optional)

```bash
# Login
docker login

# Tag & Push (replace YOUR_USERNAME)
docker tag bug-tracker:latest YOUR_USERNAME/bug-tracker:latest
docker push YOUR_USERNAME/bug-tracker:latest
```

## OR Use Automated Script
```bash
./setup.sh
```

## Docker Commands

**Stop container:**
```bash
docker stop bug-tracker-app
```

**Remove container:**
```bash
docker rm bug-tracker-app
```

**View logs:**
```bash
docker logs bug-tracker-app
```

**Pull and run from Docker Hub:**
```bash
docker pull YOUR_USERNAME/bug-tracker:latest
docker run -d -p 5000:5000 YOUR_USERNAME/bug-tracker:latest
```

## Project Structure
```
.
├── Dockerfile          # Docker image configuration
├── app.py             # Flask application
├── templates/         # HTML templates
│   ├── index.html     # Main page
│   └── add_bug.html   # Add bug form
├── static/            # CSS files
│   └── style.css      # Styles
└── README.md          # Documentation
```

## Technology Stack
- **Backend:** Python Flask
- **Database:** SQLite
- **Frontend:** HTML5, CSS3
- **Container:** Docker

## Usage
1. Click "Report New Bug" to create a bug report
2. Fill in title, description, and priority
3. View all bugs on the main page
4. Update status using dropdown menu
5. Delete bugs when resolved

---
**Author:** OSS Lab Assignment 34  
**Date:** November 2025
