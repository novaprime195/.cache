# 🚀 Apache Login App Docker - Experiment 45

## Simple Setup

```bash
cd experiment_45_Apache_Docker

# Build Docker image
docker build -t apache-login .

# Run container
docker run -p 8080:80 apache-login
```

## Access
- **URL**: http://localhost:8080
- **Login**: Use any username/password

## What it does
- Simple login page with Apache web server
- Login form that redirects to welcome page
- Runs in Docker container

## Files
- `index.html` - Login page
- `welcome.html` - Success page
- `Dockerfile` - Docker configuration
