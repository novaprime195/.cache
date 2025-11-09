# Lab 34 - Bug Tracking Tool with Docker

## Project Overview
A fully functional bug tracking system (FOSS tool) containerized with Docker.

## What's Included
1. **Bug Tracker Application** - Flask-based web app with SQLite database
2. **Docker Setup** - Complete containerization
3. **Documentation** - README and command reference
4. **Automation Script** - One-command setup

## Files Created
```
34/
├── Dockerfile              # Container configuration
├── app.py                  # Python Flask application
├── templates/
│   ├── index.html         # Main page
│   └── add_bug.html       # Add bug form
├── static/
│   └── style.css          # Styling
├── README.md              # Main documentation
├── COMMANDS.md            # Quick command reference
├── setup.sh               # Automated setup script
└── .dockerignore          # Docker ignore file
```

## Quick Start (3 Steps)

### Option 1: Using Script
```bash
./setup.sh
```

### Option 2: Manual Commands
```bash
# 1. Build
docker build -t bug-tracker:latest .

# 2. Run
docker run -d -p 5000:5000 --name bug-tracker-app bug-tracker:latest

# 3. Push (replace YOUR_USERNAME)
docker login
docker tag bug-tracker:latest YOUR_USERNAME/bug-tracker:latest
docker push YOUR_USERNAME/bug-tracker:latest
```

## Access Application
Open browser: **http://localhost:5000**

## Features Demonstrated
✅ FOSS bug tracking tool  
✅ Docker image creation  
✅ Container deployment  
✅ Docker Hub push capability  
✅ Persistent data storage  
✅ Modern web interface  

## Lab Objectives Met
1. ✅ Demonstrated FOSS bug tracking tool
2. ✅ Created Docker image
3. ✅ Ran container from image
4. ✅ Push functionality documented
5. ✅ Concise README provided

---
**Ready to use!** Follow README.md for detailed instructions.
