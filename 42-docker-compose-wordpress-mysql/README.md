# Wordpress + MySQL (docker-compose)

Minimal setup to run WordPress with MySQL using Docker Compose.

Prerequisites
- Docker installed
- docker-compose (or Docker Engine with Compose support)

Quick start

1. From this directory run:

```bash
docker-compose up -d
```

2. Open the WordPress front end in your browser:

```
http://localhost:8000
```

Default database credentials (used by the compose file)
- Database name: `wordpress`
- DB user: `wp_user`
- DB password: `wp_pass`
- MySQL root password: `root_pass`

Stop and remove containers + volumes

```bash
docker-compose down -v
```

Notes
- Change credentials in `docker-compose.yml` to something secure before using in production.
- WordPress files and MySQL data are persisted to the named volumes `wp_data` and `db_data`.
