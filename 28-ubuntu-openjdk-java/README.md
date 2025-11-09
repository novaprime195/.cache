# Java Docker Application

A simple Java application running in a Docker container with Ubuntu and OpenJDK.

## Contents

- **Dockerfile**: Ubuntu-based image with OpenJDK 11
- **HelloWorld.java**: Simple Java application

## Build & Run

```bash
# Build the Docker image
docker build -t java-app .

# Run the container
docker run java-app
```

## Output

```
Hello from Docker!
Java version: 11.x.x
```

## Requirements

- Docker installed on your system
