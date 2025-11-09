# Mount Host Directory to Docker Container

## Quick Reference

### Basic Syntax
```bash
docker run -v /host/path:/container/path image_name
```

## Methods

### 1. Using `-v` Flag (Simplest)
```bash
# Mount specific directory
docker run -v /home/user/data:/app/data ubuntu

# Mount current directory
docker run -v $(pwd):/app ubuntu

# Mount with read-only access
docker run -v /home/user/data:/app/data:ro ubuntu
```

### 2. Using `--mount` Flag (Explicit)
```bash
docker run --mount type=bind,source=/host/path,target=/container/path ubuntu
```

## Common Examples

### Mount Current Directory
```bash
docker run -v $(pwd):/app my-image
```

### Mount Home Directory
```bash
docker run -v $HOME:/home my-image
```

### Mount Multiple Directories
```bash
docker run -v /host/path1:/container/path1 -v /host/path2:/container/path2 my-image
```

## Using Docker Compose

Create `docker-compose.yml`:
```yaml
version: '3'
services:
  app:
    image: my-image
    volumes:
      - /host/path:/container/path
      - ./local/path:/app
      - ~/documents:/documents:ro
```

Run with:
```bash
docker-compose up
```

## Key Points

- **Host path**: Must be absolute (or use `$(pwd)` for current directory)
- **Container path**: Created automatically if it doesn't exist
- **Read-only**: Add `:ro` suffix to make mount read-only
- **Permissions**: Container processes run as specific user (may need to adjust host permissions)

## Troubleshooting

**Permission denied errors:**
```bash
# Check permissions on host directory
ls -la /host/path

# Run container with specific user
docker run -u $(id -u):$(id -g) -v $(pwd):/app my-image
```

**Path doesn't exist:**
- Ensure host path exists before mounting
- Container path is created automatically
