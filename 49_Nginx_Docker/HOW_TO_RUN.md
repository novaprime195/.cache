# 🚀 Nginx Docker - Experiment 49

## Simple Setup

```bash
cd experiment_49_Nginx_Docker

# Build Docker image
docker build -t nginx-login .

# Run container on port 80
docker run -p 80:80 nginx-login
```

## Access
- **URL**: http://localhost
- **Demo Login**: admin/password

## Files
- `index.html` - Simple login page
- `Dockerfile` - Nginx Docker configuration
