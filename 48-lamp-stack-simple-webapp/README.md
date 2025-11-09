# 🚀 LAMP Stack Web Application

A simple web application using **LAMP Stack** (Linux, Apache, MySQL, PHP) running on Docker containers.

## 📋 What's Included

- **Apache** web server with PHP 8.2
- **MySQL 8.0** database
- **phpMyAdmin** for database management
- Simple user management demo application

## 🛠️ Prerequisites

- Docker
- Docker Compose

## 🚀 Quick Start

1. **Start the application:**
   ```bash
   docker-compose up -d
   ```

2. **Access the application:**
   - **Main App:** http://localhost:8080
   - **phpMyAdmin:** http://localhost:8081

3. **Stop the application:**
   ```bash
   docker-compose down
   ```

## 🔑 Default Credentials

### MySQL Database
- **Host:** db
- **Database:** appdb
- **User:** appuser
- **Password:** apppass
- **Root Password:** rootpass

### phpMyAdmin
- **Server:** db
- **Username:** root
- **Password:** rootpass

## 📁 Project Structure

```
.
├── docker-compose.yml    # Docker services configuration
├── Dockerfile           # Apache + PHP container setup
├── www/                 # Web application files
│   ├── index.php       # Home page with system info
│   └── users.php       # User management demo
└── README.md           # This file
```

## ✨ Features

- **System Dashboard:** Displays PHP version, server info, and database connection status
- **User Management:** Add and delete users with MySQL database integration
- **phpMyAdmin:** Visual database management interface
- **Persistent Data:** Database data is stored in Docker volumes

## 🔧 Customization

- Edit files in the `www/` directory to modify the application
- Changes are reflected immediately (no rebuild needed)
- Modify `docker-compose.yml` to change ports or environment variables

## 🛑 Clean Up

To remove all containers and volumes:
```bash
docker-compose down -v
```

## 📝 Notes

- The application uses PHP PDO for secure database connections
- MySQL data persists in a Docker volume named `db-data`
- All services run on an isolated Docker network

---
**Made with ❤️ using LAMP Stack on Docker**
