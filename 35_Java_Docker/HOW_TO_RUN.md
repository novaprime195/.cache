# 🚀 Java Docker - Experiment 35

## Simple Java Application on Ubuntu with OpenJDK

### Build and Run
```bash
cd experiment_35_Java_Docker

# Build Docker image
docker build -t java-hello-world .

# Run container
docker run java-hello-world
```

## What it does
- **Ubuntu**: Base image with Ubuntu 22.04
- **OpenJDK**: Java development kit installed
- **Java App**: Simple Hello World application
- **Auto-compile**: Dockerfile compiles Java source

## Files
- `HelloWorld.java` - Simple Java application
- `Dockerfile` - Ubuntu + OpenJDK configuration

## Output
The application displays:
- Hello World message
- System information (Java version, OS)
- Simple counting demonstration
- Success message

## Simple Commands
```bash
# Build image
docker build -t java-hello-world .

# Run application
docker run java-hello-world

# Interactive shell (optional)
docker run -it java-hello-world bash
```
