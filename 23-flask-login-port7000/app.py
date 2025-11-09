from flask import Flask, render_template, request, redirect, url_for, flash

app = Flask(__name__)
app.secret_key = 'your-secret-key-here'

@app.route('/')
def index():
    return render_template('login.html')

@app.route('/login', methods=['POST'])
def login():
    username = request.form.get('username')
    password = request.form.get('password')
    
    if username == 'admin' and password == 'password':
        flash('Login successful!', 'success')
        return redirect(url_for('success'))
    else:
        flash('Invalid credentials. Try again.', 'error')
        return redirect(url_for('index'))

@app.route('/success')
def success():
    return '<h1>Welcome! You are logged in.</h1>'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=7000, debug=True)
