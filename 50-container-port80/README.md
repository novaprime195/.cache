# Docker nginx Container

## Quick Start

Run nginx container on port 5000:

```bash
docker run -d -p 80:80 --name nginx-container nginx
```

## Access

Open browser: `http://localhost:80`

## Manage Container

```bash
# Stop container
docker stop nginx-container

# Start container
docker start nginx-container

# Remove container
docker rm -f nginx-container

# View logs
docker logs nginx-container
```

## Info

- **Image**: nginx
- **Host Port**: 80
- **Container Port**: 80
- **Mode**: Detached (-d)
