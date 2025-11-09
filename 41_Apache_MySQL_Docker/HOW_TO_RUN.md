# 🚀 Apache MySQL Docker App - Experiment 41

## Simple Setup

### 1. Build and Run (Port 80)
```bash
cd experiment_41_Apache_MySQL_Docker

# Start with docker-compose (includes MySQL)
docker-compose up -d
```

### 2. Access Application
- **URL**: http://localhost
- **Login**: admin/admin123

### 3. Push to Repository
```bash
# Tag image
docker tag experiment_41_apache_mysql_docker_web your-username/apache-login-app

# Push to Docker Hub
docker push your-username/apache-login-app
```

### 4. Run from Another Instance
```bash
# Pull and run from repository
docker pull your-username/apache-login-app
docker run -p 80:80 your-username/apache-login-app
```

## What it includes
- Apache web server with PHP
- MySQL database with user table
- Simple login form
- Database connectivity
- Runs on port 80

## Files
- `index.html` - Login form
- `login.php` - Login processing with MySQL
- `docker-compose.yml` - Multi-container setup
- `Dockerfile` - Apache/PHP image
- `init.sql` - Database initialization

## Simple Commands
```bash
# Start everything
docker-compose up -d

# Stop everything
docker-compose down

# View logs
docker-compose logs
```
