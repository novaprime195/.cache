# Django Login Form Docker App

A simple Django login form running in Docker on port 8000.

## Build and Run

```bash
# Build the Docker image
docker build -t django-login .

# Run the container
docker run -p 8000:6000 django-login
```

## Access the App

Open your browser and go to: `http://localhost:8000`

## Default Login Credentials

A default admin user is automatically created:
- **Username**: `admin`
- **Password**: `admin`

Login at: `http://localhost:8000/login/`
