# 🚀 Flask Hello World - Experiment 43

## A. Create Docker Image

```bash
cd experiment_43_Flask_HelloWorld

# Build Docker image
docker build -t flask-hello-world .
```

## B. Run Container on Port 5000

```bash
# Run container (maps port 5000 to host port 5000)
docker run -p 5000:5000 flask-hello-world
```

## Access
- **URL**: http://localhost:5000
- **Test**: `curl http://localhost:5000`

## Files
- `app.py` - Simple Flask Hello World app
- `Dockerfile` - Docker configuration  
- `requirements.txt` - Python dependencies (Flask)

## Simple Commands Summary
```bash
# Step 1: Build image
docker build -t flask-hello-world .

# Step 2: Run on port 5000
docker run -p 5000:5000 flask-hello-world
```
