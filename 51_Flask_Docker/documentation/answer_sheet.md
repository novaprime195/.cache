# Experiment 51 Answer Sheet: Flask Hello World Application and Docker Image

## Important Files and Locations

### Flask Application Files:
1. **`app/app.py`** - Main Flask application with routes and logic
2. **`app/requirements.txt`** - Python dependencies for Flask
3. **`docker/Dockerfile`** - Docker image configuration
4. **`docker/build_and_run.sh`** - Docker build and run script

### Docker Configuration:
1. **Base Image**: `python:3.9-slim`
2. **Working Directory**: `/app`
3. **Exposed Port**: `5000`
4. **Image Name**: `hello-flask`
5. **Container Name**: `flask-app`

## Implementation Steps

### Step 1: Create Flask Application
```python
# app/app.py - Main Flask application
from flask import Flask, jsonify, render_template_string
app = Flask(__name__)

@app.route('/')
def hello_world():
    return "Hello World Flask Application!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```

### Step 2: Create Requirements File
```txt
# app/requirements.txt
Flask==2.3.3
Werkzeug==2.3.7
```

### Step 3: Create Dockerfile
```dockerfile
# docker/Dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY app/requirements.txt .
RUN pip install -r requirements.txt
COPY app/app.py .
EXPOSE 5000
CMD ["python", "app.py"]
```

### Step 4: Build Docker Image
```bash
docker build -t hello-flask -f docker/Dockerfile .
```

### Step 5: Run Docker Container
```bash
docker run -d -p 5000:5000 --name flask-app hello-flask
```

## Flask Application Features

### Routes Implemented:
1. **`/`** - Main hello world page with HTML interface
2. **`/about`** - About page with application information
3. **`/api`** - JSON API endpoint returning structured data
4. **`/health`** - Health check endpoint for monitoring

### Application Components:
- **HTML Template**: Responsive design with CSS styling
- **JSON API**: RESTful endpoint with metadata
- **Error Handling**: Custom 404 error pages
- **Environment Detection**: Docker vs local execution
- **System Information**: Python version, Flask version, current time

## Docker Configuration Details

### Dockerfile Components:
```dockerfile
FROM python:3.9-slim          # Base image
WORKDIR /app                  # Working directory
COPY requirements.txt .       # Copy dependencies first
RUN pip install -r requirements.txt  # Install dependencies
COPY app.py .                 # Copy application code
RUN groupadd -r flaskgroup && useradd -r -g flaskgroup flaskuser  # Security
USER flaskuser                # Run as non-root user
EXPOSE 5000                   # Expose Flask port
HEALTHCHECK --interval=30s    # Health monitoring
CMD ["python", "app.py"]      # Start command
```

### Container Features:
- **Security**: Non-root user execution
- **Health Check**: Automated monitoring endpoint
- **Port Mapping**: 5000:5000 (host:container)
- **Restart Policy**: unless-stopped
- **Logging**: Accessible via docker logs

## Testing and Verification

### Local Testing:
```bash
# Install dependencies
pip3 install -r app/requirements.txt

# Run Flask app locally
python3 app/app.py

# Test endpoints
curl http://localhost:5000
curl http://localhost:5000/api
```

### Docker Testing:
```bash
# Build and run container
docker build -t hello-flask .
docker run -d -p 5000:5000 --name flask-app hello-flask

# Test containerized app
curl http://localhost:5000
docker logs flask-app
docker ps | grep flask-app
```

### Endpoint Verification:
1. **Home Page**: `curl http://localhost:5000` - HTML response
2. **API Endpoint**: `curl http://localhost:5000/api` - JSON response
3. **Health Check**: `curl http://localhost:5000/health` - Status response
4. **About Page**: `curl http://localhost:5000/about` - About information

## Docker Commands Reference

### Essential Commands:
```bash
# Build image
docker build -t hello-flask .

# Run container
docker run -d -p 5000:5000 --name flask-app hello-flask

# View running containers
docker ps

# View logs
docker logs flask-app

# Stop container
docker stop flask-app

# Start container
docker start flask-app

# Remove container
docker rm flask-app

# Remove image
docker rmi hello-flask

# Access container shell
docker exec -it flask-app /bin/bash
```

### Image Information:
```bash
# List images
docker images | grep hello-flask

# Inspect image
docker inspect hello-flask

# View image history
docker history hello-flask
```

## Access Points

### Application URLs:
- **Main Application**: http://localhost:5000
- **API Endpoint**: http://localhost:5000/api  
- **Health Check**: http://localhost:5000/health
- **About Page**: http://localhost:5000/about

### Container Management:
- **Container Name**: flask-app
- **Image Name**: hello-flask
- **Port**: 5000
- **Protocol**: HTTP

## Success Criteria
✅ Flask application created with multiple routes  
✅ Docker image built successfully  
✅ Container runs and serves application  
✅ All endpoints accessible and functional  
✅ Proper error handling implemented  
✅ Security best practices (non-root user)  
✅ Health monitoring configured  
