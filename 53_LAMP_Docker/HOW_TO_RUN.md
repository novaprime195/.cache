# 🚀 Quick Implementation Guide - Experiment 53

## How to Run LAMP Stack Docker Container

### Prerequisites
- Docker installed and running
- Internet connection for pulling images

### One-Click Setup
```bash
cd experiment_53_LAMP_Docker

# Pull and run LAMP container with web app
sudo ./scripts/lamp_docker_setup.sh
```

### Manual Setup
```bash
# 1. Pull LAMP stack image
docker pull mattrayner/lamp:latest

# 2. Create and run container
./docker/run_lamp_container.sh

# 3. Deploy web application
./scripts/deploy_webapp.sh
```

### Access Web Application
```bash
# Open in browser
http://localhost:8080

# Or use curl to test
curl http://localhost:8080
```

### Container Management
```bash
# View running containers
docker ps

# View logs
docker logs lamp-server

# Stop container
docker stop lamp-server

# Restart container
docker start lamp-server
```

### Web Application Features
- **PHP-based**: Dynamic web application
- **MySQL Database**: Student management system
- **Responsive Design**: Bootstrap-based UI
- **CRUD Operations**: Create, Read, Update, Delete students

### Troubleshooting
```bash
# Check Docker service
systemctl status docker

# Check container logs
docker logs lamp-server

# Test MySQL connection
docker exec -it lamp-server mysql -u root -p
```

**Note**: Default MySQL root password is usually empty or 'root'
