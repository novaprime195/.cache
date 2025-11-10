Create a simple Hello-world python flask application and create the docker image of that Flask application.
<!-- # Create a Project Folder: -->
mkdir flask-hello
cd flask-hello


<!-- # Create the Flask App: -->
nano app.py

<!-- paste below -->
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello, World! This Flask app is running inside Docker!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)


# requirements.txt:
nano requirements.txt

# paste below
Flask

<!-- # Dockerfile: -->
nano Dockerfile
<!-- paste below code -->
# Use an official Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy all project files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose Flask port
EXPOSE 5000

# Command to run the app
CMD ["python", "app.py"]


<!-- # cmds: -->
docker build -t flask-hello .

docker run -d -p 5000:5000 --name flask-hello-container flask-hello

<!--check if error occur -->
docker ps
docker rm -f container_name
<!-- then rerun -->


