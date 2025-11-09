# Flask Login Form - Docker

A simple login form application using Flask running on port 7000.

## Build and Run

```bash
# Build the Docker image
docker build -t flask-login .

# Run the container
docker run -p 7000:7000 flask-login
```

## Access the Application

Open your browser and go to: `http://localhost:7000`

**Login Credentials:**
- Username: `admin`
- Password: `password`

## Stop the Container

```bash
docker ps  # Find the container ID
docker stop <container-id>
```
