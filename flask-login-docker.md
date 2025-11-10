# Create a docker image of simple login form using Flask on port 7000.


# folder structure
flask-login-docker/
├── app.py
├── templates/
│   └── login.html
├── requirements.txt
└── Dockerfile


# app.py:
from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('login.html')

@app.route('/login', methods=['POST'])
def login():
    username = request.form.get('username')
    password = request.form.get('password')
    if username == 'admin' and password == '1234':
        return f"<h2>Welcome, {username}!</h2>"
    else:
        return "<h2>Invalid credentials. Try again!</h2>"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=7000)


# login.html:
<!DOCTYPE html>
<html>
<head>
    <title>Login Form</title>
</head>
<body style="font-family:Arial; text-align:center; margin-top:100px;">
    <h2>Simple Login Form</h2>
    <form method="POST" action="/login">
        <input type="text" name="username" placeholder="Username" required><br><br>
        <input type="password" name="password" placeholder="Password" required><br><br>
        <button type="submit">Login</button>
    </form>
</body>
</html>


# requirements.txt:
Flask==3.0.3


# Dockerfile:
# Use official Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy files
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expose port 7000
EXPOSE 7000

# Run Flask app
CMD ["python", "app.py"]


# cmds:

docker build -t flask-login-app .

docker run -d -p 7000:7000 --name login flask-login-app

docker run -d -p 7000:7000 --name login flask-login-app


# Open your browser and go to:
http://localhost:7000


# credentials:

Username: admin

Password: 1234