# Docker Nginx + MySQL Setup

## Quick Start

```bash
# Start both containers
docker-compose up -d

# Stop containers
docker-compose down

# View logs
docker-compose logs
```

## Access

- **Nginx Web Server**: http://localhost:8080
- **MySQL Database**: localhost:3306

## MySQL Credentials

- Root Password: `rootpassword`
- Database: `mydb`
- User: `user`
- Password: `userpassword`

## Customization

- Edit `html/index.html` to change the web page
- Modify `docker-compose.yml` to adjust settings
