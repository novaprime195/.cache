# Simple Web Form with MySQL Database

A simple web form to insert records into MySQL database.

## Setup Instructions

## 🐳 Docker Setup (Easiest Method!)

### Quick Start with Docker

1. **Start everything:**
   ```bash
   docker-compose up -d
   ```

2. **Access the application:**
   - Web Form: http://localhost:8080
   - phpMyAdmin: http://localhost:8081 (username: `root`, password: `rootpass`)

3. **Stop everything:**
   ```bash
   docker-compose down
   ```

### What's Included:
- ✅ Web server with PHP
- ✅ MySQL database
- ✅ phpMyAdmin for database management
- ✅ Auto-setup of database and tables

### Docker Commands:
```bash
# Start containers
docker-compose up -d

# View logs
docker-compose logs -f

# Stop containers
docker-compose down

# Stop and remove all data
docker-compose down -v
```

No need to install PHP or MySQL locally!

### 1. Database Setup
Run the SQL script to create database and table:
```bash
mysql -u root -p < setup.sql
```

Or manually in MySQL:
```sql
CREATE DATABASE userdb;
USE userdb;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 2. Configure Database Connection
Edit `insert.php` if needed:
- **servername**: localhost
- **username**: root
- **password**: (your MySQL password)
- **database**: userdb

### 3. Run the Application

**Option 1: Using PHP Built-in Server**
```bash
php -S localhost:8000
```
Then open: http://localhost:8000

**Option 2: Using XAMPP/WAMP**
- Place files in `htdocs/` or `www/` folder
- Start Apache and MySQL
- Open: http://localhost/26/

## Files

- `index.html` - Web form interface
- `insert.php` - PHP script to insert data
- `setup.sql` - Database setup script
- `README.md` - This file

## Usage

1. Open the form in browser
2. Fill in Name, Email, and Phone
3. Click Submit
4. Record will be inserted into MySQL database

## View Records

To view inserted records:
```sql
SELECT * FROM userdb.users;
```

---

