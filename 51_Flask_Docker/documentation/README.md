# Experiment 51: Flask Hello World Application and Docker Image

## Objective
Create a simple Flask "Hello World" application and containerize it using Docker to demonstrate web application development and containerization concepts.

## Application Features
### Flask Web Application:
- **Hello World Page**: Main landing page with responsive design
- **About Page**: Information about the application
- **JSON API Endpoint**: RESTful API returning JSON data
- **Health Check**: Monitoring endpoint for container health
- **Error Handling**: Custom 404 error pages

### Technical Stack:
- **Backend**: Python Flask framework
- **Frontend**: HTML5 with CSS styling
- **Container**: Docker with Python 3.9 slim image
- **Port**: 5000 (Flask default)

## Docker Configuration
- **Base Image**: python:3.9-slim
- **Working Directory**: /app
- **Port Exposed**: 5000
- **User**: Non-root user (flaskuser) for security
- **Health Check**: Automated container health monitoring

## Application Structure
```
app/
├── app.py              # Main Flask application
├── requirements.txt    # Python dependencies
```

## Key Features
### Web Application:
- **Multiple Routes**: /, /about, /api, /health
- **Dynamic Content**: Current time, system information
- **Responsive Design**: Mobile-friendly interface
- **Environment Detection**: Detects Docker vs local execution

### Docker Image:
- **Optimized Layers**: Requirements cached separately
- **Security**: Non-root user execution
- **Health Monitoring**: Built-in health checks
- **Environment Variables**: Configurable Flask settings

## Flask Routes and Functionality
1. **`/` (Home)**: Main hello world page with system info
2. **`/about`**: About page with application details  
3. **`/api`**: JSON API endpoint with metadata
4. **`/health`**: Health check for monitoring/orchestration

## Dependencies
```txt
Flask==2.3.3
Werkzeug==2.3.7
click==8.1.7
itsdangerous==2.1.2
MarkupSafe==2.1.3
Jinja2==3.1.2
```

## Docker Commands Used
```bash
# Build image
docker build -t hello-flask .

# Run container
docker run -d -p 5000:5000 --name flask-app hello-flask

# View logs
docker logs flask-app

# Health check
curl http://localhost:5000/health
```
