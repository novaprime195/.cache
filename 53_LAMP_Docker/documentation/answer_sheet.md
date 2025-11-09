# Experiment 53 Answer Sheet: LAMP Stack Docker Container

## Important Commands and Steps

### Docker Hub Image Pull:
```bash
docker pull mattrayner/lamp:latest
```

### Container Creation and Running:
```bash
docker run -d \
    --name lamp-server \
    -p 8080:80 \
    -p 3306:3306 \
    -v $(pwd)/webapp-volume:/app \
    -e MYSQL_ROOT_PASSWORD=rootpass \
    mattrayner/lamp:latest
```

### Key Configuration Files and Locations:

#### Docker Configuration:
1. **Container Image**: `mattrayner/lamp:latest` (from Docker Hub)
2. **Container Name**: `lamp-server`
3. **Port Mappings**: 8080:80 (web), 3306:3306 (database)
4. **Volume Mounts**: `./webapp-volume:/app`

#### Web Application Files:
1. **`webapp/index.php`** - Main application file with PHP code
2. **`/app/`** - Container web root directory
3. **`/var/www/html/`** - Apache document root (alternative)

#### Database Configuration:
1. **Database**: MySQL (included in LAMP container)
2. **Root Password**: rootpass (set via environment variable)
3. **Application Database**: student_db
4. **Connection**: localhost:3306

## Implementation Steps:

### Step 1: Pull LAMP Image
```bash
docker pull mattrayner/lamp:latest
```

### Step 2: Create Web Application
- Create `index.php` with PHP/MySQL code
- Implement Student Management System
- Use Bootstrap for responsive design

### Step 3: Run Container with Volumes
```bash
docker run -d --name lamp-server \
    -p 8080:80 -p 3306:3306 \
    -v $(pwd)/webapp-volume:/app \
    -e MYSQL_ROOT_PASSWORD=rootpass \
    mattrayner/lamp:latest
```

### Step 4: Deploy Application
```bash
cp -r webapp/* webapp-volume/
docker exec lamp-server chown -R www-data:www-data /app
```

### Step 5: Setup Database
```bash
docker exec lamp-server mysql -u root -prootpass -e "
CREATE DATABASE IF NOT EXISTS student_db;
GRANT ALL PRIVILEGES ON student_db.* TO 'root'@'%';
FLUSH PRIVILEGES;"
```

## Web Application Features:

### Technology Stack:
- **Frontend**: HTML5, CSS3, Bootstrap 5, JavaScript
- **Backend**: PHP 7.4+ with PDO
- **Database**: MySQL 8.0
- **Server**: Apache 2.4

### Application Components:
1. **Student Registration Form** - Add new students
2. **Student List Display** - View all registered students
3. **System Information Panel** - Show PHP/MySQL versions
4. **Responsive Design** - Mobile-friendly interface

### Database Operations:
- **CREATE**: Insert new student records
- **READ**: Display student list
- **Database Auto-creation**: Creates database and table if not exist
- **Sample Data**: Populates initial demo data

## Access Points:

### Web Application:
- **URL**: http://localhost:8080
- **Interface**: Student Management System

### Database Access:
- **Host**: localhost
- **Port**: 3306
- **Username**: root
- **Password**: rootpass
- **Database**: student_db

## Container Management:

### Essential Commands:
```bash
# View container status
docker ps

# View logs
docker logs lamp-server

# Access container shell
docker exec -it lamp-server bash

# Access MySQL
docker exec -it lamp-server mysql -u root -prootpass

# Stop/Start container
docker stop lamp-server
docker start lamp-server

# Remove container
docker rm lamp-server
```

## Verification Steps:
1. **Container Running**: `docker ps | grep lamp-server`
2. **Web Access**: `curl http://localhost:8080`
3. **Database Connection**: `docker exec lamp-server mysql -u root -prootpass -e "SHOW DATABASES;"`
4. **Application Function**: Test form submission and data display

## File Structure:
```
experiment_53_LAMP_Docker/
├── webapp/
│   └── index.php          # Main web application
├── docker/
│   └── run_lamp_container.sh
├── scripts/
│   ├── lamp_docker_setup.sh
│   ├── deploy_webapp.sh
│   └── test_lamp_stack.sh
└── webapp-volume/         # Container volume mount
```
