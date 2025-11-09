# Simple Web Application with Docker

A minimal Flask web application running in a Docker container.

## Quick Start

### Build the Docker Image
```bash
docker build -t simple-webapp .
```

### Run the Container
```bash
docker run -p 5000:5000 simple-webapp
```

### Access the Application
Open your browser and visit: http://localhost:5000

## Endpoints
- `/` - Welcome page
- `/health` - Health check endpoint

## Files
- `app.py` - Flask web application
- `Dockerfile` - Docker image configuration
- `requirements.txt` - Python dependencies
