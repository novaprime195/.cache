from flask import Flask, jsonify, request
import mysql.connector
import redis
import os
import json
from datetime import datetime

app = Flask(__name__)

# Database configuration
DB_CONFIG = {
    'host': 'database',
    'user': 'dbuser',
    'password': 'dbpass',
    'database': 'testdb'
}

# Redis configuration
REDIS_HOST = 'cache'
REDIS_PORT = 6379

@app.route('/')
def home():
    """Main application route"""
    return jsonify({
        'message': 'Docker Compose Demo - Flask App',
        'status': 'running',
        'timestamp': datetime.now().isoformat(),
        'services': {
            'database': 'connected',
            'cache': 'connected',
            'web': 'connected'
        }
    })

@app.route('/health')
def health():
    """Health check endpoint"""
    return jsonify({'status': 'healthy'}), 200

@app.route('/db-test')
def db_test():
    """Test database connection"""
    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor()
        cursor.execute("SELECT 'Database connection successful' as message")
        result = cursor.fetchone()
        cursor.close()
        conn.close()
        return jsonify({'database': result[0]})
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/cache-test')
def cache_test():
    """Test Redis cache connection"""
    try:
        r = redis.Redis(host=REDIS_HOST, port=REDIS_PORT, decode_responses=True)
        r.set('test_key', 'Cache connection successful')
        result = r.get('test_key')
        return jsonify({'cache': result})
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/users', methods=['GET', 'POST'])
def users():
    """User management endpoint"""
    if request.method == 'POST':
        # Add new user
        data = request.json
        try:
            conn = mysql.connector.connect(**DB_CONFIG)
            cursor = conn.cursor()
            cursor.execute(
                "INSERT INTO users (name, email) VALUES (%s, %s)",
                (data['name'], data['email'])
            )
            conn.commit()
            user_id = cursor.lastrowid
            cursor.close()
            conn.close()
            return jsonify({'id': user_id, 'message': 'User created successfully'}), 201
        except Exception as e:
            return jsonify({'error': str(e)}), 500
    
    else:
        # Get all users
        try:
            conn = mysql.connector.connect(**DB_CONFIG)
            cursor = conn.cursor()
            cursor.execute("SELECT id, name, email, created_at FROM users")
            users = []
            for row in cursor.fetchall():
                users.append({
                    'id': row[0],
                    'name': row[1],
                    'email': row[2],
                    'created_at': row[3].isoformat() if row[3] else None
                })
            cursor.close()
            conn.close()
            return jsonify({'users': users})
        except Exception as e:
            return jsonify({'error': str(e)}), 500

@app.route('/stats')
def stats():
    """Application statistics"""
    try:
        # Get database stats
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor()
        cursor.execute("SELECT COUNT(*) FROM users")
        user_count = cursor.fetchone()[0]
        cursor.close()
        conn.close()
        
        # Get cache stats
        r = redis.Redis(host=REDIS_HOST, port=REDIS_PORT)
        cache_info = r.info()
        
        return jsonify({
            'database': {
                'users': user_count,
                'status': 'connected'
            },
            'cache': {
                'keys': cache_info['db0']['keys'] if 'db0' in cache_info else 0,
                'memory': cache_info['used_memory_human'],
                'status': 'connected'
            },
            'application': {
                'name': 'Docker Compose Demo',
                'version': '1.0',
                'environment': os.environ.get('FLASK_ENV', 'production')
            }
        })
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
