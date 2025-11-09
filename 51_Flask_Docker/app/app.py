#!/usr/bin/env python3
"""
Simple Hello World Flask Application
Experiment 51 - Flask Docker Demo
"""

from flask import Flask, jsonify, render_template_string
from datetime import datetime
import os

# Create Flask application instance
app = Flask(__name__)

# HTML template for better presentation
HTML_TEMPLATE = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hello World Flask App</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            text-align: center;
            max-width: 600px;
            margin: 20px;
        }
        h1 {
            color: #333;
            margin-bottom: 1rem;
        }
        .info {
            background: #f8f9fa;
            padding: 1rem;
            border-radius: 5px;
            margin: 1rem 0;
        }
        .links {
            margin-top: 2rem;
        }
        .links a {
            display: inline-block;
            margin: 0.5rem;
            padding: 0.5rem 1rem;
            background: #667eea;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .links a:hover {
            background: #764ba2;
        }
        .emoji {
            font-size: 2rem;
            margin: 1rem 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="emoji">🐳 🐍 🌍</div>
        <h1>{{ title }}</h1>
        <div class="info">
            <p><strong>Message:</strong> {{ message }}</p>
            <p><strong>Current Time:</strong> {{ current_time }}</p>
            <p><strong>Flask Version:</strong> {{ flask_version }}</p>
            <p><strong>Python Version:</strong> {{ python_version }}</p>
            <p><strong>Environment:</strong> {{ environment }}</p>
        </div>
        <div class="links">
            <a href="/">Home</a>
            <a href="/about">About</a>
            <a href="/api">API</a>
            <a href="/health">Health Check</a>
        </div>
    </div>
</body>
</html>
"""

@app.route('/')
def hello_world():
    """Main route - Hello World page"""
    import flask
    import sys
    
    return render_template_string(HTML_TEMPLATE,
        title="Hello World Flask Application!",
        message="Welcome to the Flask Docker Demo (Experiment 51)",
        current_time=datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        flask_version=flask.__version__,
        python_version=sys.version.split()[0],
        environment="Docker Container" if os.path.exists('/.dockerenv') else "Local Development"
    )

@app.route('/about')
def about():
    """About page"""
    return render_template_string(HTML_TEMPLATE,
        title="About This Application",
        message="This is a simple Flask application demonstrating containerization with Docker",
        current_time=datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        flask_version="Flask web framework",
        python_version="Python programming language",
        environment="Experiment 51 - OSS Lab"
    )

@app.route('/api')
def api():
    """JSON API endpoint"""
    return jsonify({
        'message': 'Hello World from Flask API!',
        'status': 'success',
        'timestamp': datetime.now().isoformat(),
        'experiment': '51 - Flask Docker',
        'version': '1.0.0',
        'endpoints': [
            {'path': '/', 'description': 'Main hello world page'},
            {'path': '/about', 'description': 'About page'},
            {'path': '/api', 'description': 'JSON API endpoint'},
            {'path': '/health', 'description': 'Health check endpoint'}
        ]
    })

@app.route('/health')
def health_check():
    """Health check endpoint for monitoring"""
    return jsonify({
        'status': 'healthy',
        'service': 'flask-hello-world',
        'timestamp': datetime.now().isoformat(),
        'uptime': 'running'
    })

@app.errorhandler(404)
def not_found(error):
    """Custom 404 error page"""
    return jsonify({
        'error': 'Not Found',
        'message': 'The requested URL was not found on the server',
        'status_code': 404
    }), 404

if __name__ == '__main__':
    # Configuration
    port = int(os.environ.get('PORT', 5000))
    debug = os.environ.get('FLASK_DEBUG', 'False').lower() == 'true'
    
    print("=" * 50)
    print("🐍 Flask Hello World Application")
    print("=" * 50)
    print(f"🌐 Running on: http://0.0.0.0:{port}")
    print(f"🔧 Debug mode: {debug}")
    print(f"📁 Environment: {'Docker' if os.path.exists('/.dockerenv') else 'Local'}")
    print("=" * 50)
    
    # Run the Flask application
    app.run(
        host='0.0.0.0',  # Listen on all interfaces (important for Docker)
        port=port,
        debug=debug
    )
