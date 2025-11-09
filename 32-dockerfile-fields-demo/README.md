# Docker Container Demo - Ubuntu 22.04

A simple demonstration of all Dockerfile fields using Ubuntu as the base distribution.

## 📋 Dockerfile Fields Explained

| Field | Purpose | Example |
|-------|---------|---------|
| `FROM` | Base image to build upon | `ubuntu:22.04` |
| `LABEL` | Metadata (author, version, description) | `maintainer="user@example.com"` |
| `ARG` | Build-time variables | `ARG APP_DIR=/app` |
| `ENV` | Environment variables | `ENV LANG=C.UTF-8` |
| `WORKDIR` | Set working directory | `WORKDIR /app` |
| `RUN` | Execute commands during build | `RUN apt-get update` |
| `COPY` | Copy files from host to image | `COPY app.py .` |
| `ADD` | Like COPY + extract archives/URLs | `ADD config.tar.gz /etc/` |
| `EXPOSE` | Document container ports | `EXPOSE 8080` |
| `VOLUME` | Mount point for persistent data | `VOLUME ["/data"]` |
| `USER` | Switch to specified user | `USER appuser` |
| `HEALTHCHECK` | Container health monitoring | `HEALTHCHECK CMD curl ...` |
| `ENTRYPOINT` | Main executable (fixed) | `ENTRYPOINT ["python3"]` |
| `CMD` | Default arguments (overridable) | `CMD ["app.py"]` |

## 🚀 Quick Start

### Build the Image
```bash
docker build -t ubuntu-demo:1.0 .
```

### Run the Container
```bash
docker run -d -p 8080:8080 --name my-ubuntu-app ubuntu-demo:1.0
```

### Test the Application
```bash
curl http://localhost:8080
curl http://localhost:8080/health
```

### View Logs
```bash
docker logs my-ubuntu-app
```

### Stop & Remove
```bash
docker stop my-ubuntu-app
docker rm my-ubuntu-app
```

## 🔍 Container Info

- **Base OS**: Ubuntu 22.04 LTS
- **Application**: Simple Python HTTP server
- **Port**: 8080
- **Health Check**: Every 30s on `/health` endpoint
- **User**: Non-root user (appuser)

## 📁 Project Structure

```
.
├── Dockerfile          # Multi-field demo
├── app.py             # Python web server
├── requirements.txt   # Python dependencies
├── .dockerignore      # Build exclusions
└── README.md          # This file
```

## 💡 Tips

- `ARG` is for build-time only, `ENV` persists at runtime
- `ENTRYPOINT` + `CMD` work together: `ENTRYPOINT` is the command, `CMD` is default args
- Use `.dockerignore` to reduce build context size
- `HEALTHCHECK` helps orchestrators know if container is working
- Always run as non-root user (`USER`) for security

---
**Created**: November 2025 | **Purpose**: Educational Demo
