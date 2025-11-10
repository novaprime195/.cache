# 54 Create a Docker image of simple web application from using HTTP web server at port 5000 in host.


# Folder structure:
simple-web-docker/
├── index.html
└── Dockerfile


# index.html:
<!DOCTYPE html>
<html>
<head>
    <title>Simple Web Application</title>
</head>
<body style="font-family:Arial; text-align:center; margin-top:100px;">
    <h1>Welcome to My Simple Web App</h1>
    <p>Served using Python HTTP Server in Docker!</p>
</body>
</html>


# Dockerfile:
# Use a lightweight Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy HTML file into container
COPY index.html .

# Expose port 5000 (inside container)
EXPOSE 5000

# Run simple HTTP server
CMD ["python", "-m", "http.server", "5000"]


# cmds:
docker build -t simple-web-app .

docker run -d -p 5000:5000 --name webserver simple-web-app


# Open your browser and go to:

👉 http://localhost:5000