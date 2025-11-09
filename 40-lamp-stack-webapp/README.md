# LAMP Stack Todo Application 📝

A simple Todo web application built with LAMP stack (Linux, Apache, MySQL, PHP) running in Docker.

## Features
- ✅ Add new tasks
- ❌ Delete tasks
- 💾 MySQL database integration
- 🐳 Fully containerized with Docker

## Quick Start

### 1. Pull LAMP Stack Image
```bash
docker pull mattrayner/lamp:latest-1804
```

### 2. Build the Custom Image
```bash
docker build -t lamp-todo-app .
```

### 3. Run the Container
```bash
docker run -d -p 8080:80 --name todo-app lamp-todo-app
```

### 4. Access the Application
Open your browser and visit:
```
http://localhost:8080
```

## Push to Docker Hub

### 1. Login to Docker Hub
```bash
docker login
```

### 2. Tag the Image
```bash
docker tag lamp-todo-app your-dockerhub-username/lamp-todo-app:v1.0
```

### 3. Push to Repository
```bash
docker push your-dockerhub-username/lamp-todo-app:v1.0
```

## Project Structure
```
.
├── Dockerfile           # Docker configuration
├── .dockerignore       # Files to exclude from build
├── app/
│   └── index.php       # Todo application (PHP + MySQL)
└── README.md           # This file
```

## Database Details
- **Database Name:** todoapp
- **Table:** todos (id, task, created_at)
- **User:** root (default)
- **Auto-created on first run**

## Container Management

**Stop container:**
```bash
docker stop todo-app
```

**Start container:**
```bash
docker start todo-app
```

**Remove container:**
```bash
docker rm -f todo-app
```

**View logs:**
```bash
docker logs todo-app
```

## Technologies Used
- **Linux** (Ubuntu 18.04)
- **Apache** web server
- **MySQL** database
- **PHP** 7.x
- **Docker** containerization

---
**Note:** Replace `your-dockerhub-username` with your actual Docker Hub username when pushing images.
