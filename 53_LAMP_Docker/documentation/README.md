# Experiment 53: LAMP Stack Docker Container and Web Application

## Objective
Pull a LAMP Stack container from Docker Hub and deploy a custom web application demonstrating PHP, MySQL, and Apache integration.

## Container Details
- **Docker Image**: mattrayner/lamp:latest
- **Container Name**: lamp-server
- **Web Port**: 8080 (mapped to container port 80)
- **Database Port**: 3306 (mapped to container port 3306)

## Web Application Features
### Student Management System:
- **Frontend**: Bootstrap-based responsive design
- **Backend**: PHP with PDO for database operations
- **Database**: MySQL with student_db database
- **Features**: 
  - Add new students (Create)
  - View all students (Read)
  - Student data validation
  - System information display

## LAMP Stack Components
- **Linux**: Ubuntu base image
- **Apache**: Web server (port 80/8080)
- **MySQL**: Database server (port 3306)
- **PHP**: Server-side scripting

## Docker Configuration
- **Base Image**: mattrayner/lamp:latest from Docker Hub
- **Volumes**: 
  - `./webapp-volume:/app` - Web application files
  - `./mysql-data:/var/lib/mysql` - Database persistence
- **Environment**: 
  - `MYSQL_ROOT_PASSWORD=rootpass`
- **Restart Policy**: unless-stopped

## Application Structure
```
webapp/
├── index.php          # Main application file
├── css/              # Custom stylesheets (if needed)
├── js/               # JavaScript files (if needed)
└── assets/           # Images and other assets
```

## Database Schema
```sql
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    course VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Key Docker Commands
```bash
# Pull LAMP image
docker pull mattrayner/lamp:latest

# Run container
docker run -d --name lamp-server -p 8080:80 -p 3306:3306 mattrayner/lamp:latest

# View logs
docker logs lamp-server

# Execute commands in container
docker exec -it lamp-server bash

# Stop/Start container
docker stop lamp-server
docker start lamp-server
```
