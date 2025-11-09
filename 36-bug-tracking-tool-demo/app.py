from flask import Flask, render_template, request, redirect, url_for
import json
import os
from datetime import datetime

app = Flask(__name__)
BUGS_FILE = 'bugs.json'

def load_bugs():
    if os.path.exists(BUGS_FILE):
        with open(BUGS_FILE, 'r') as f:
            return json.load(f)
    return []

def save_bugs(bugs):
    with open(BUGS_FILE, 'w') as f:
        json.dump(bugs, f, indent=2)

@app.route('/')
def index():
    bugs = load_bugs()
    return render_template('index.html', bugs=bugs)

@app.route('/add', methods=['POST'])
def add_bug():
    bugs = load_bugs()
    bug = {
        'id': len(bugs) + 1,
        'title': request.form['title'],
        'description': request.form['description'],
        'status': 'Open',
        'priority': request.form['priority'],
        'created_at': datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    }
    bugs.append(bug)
    save_bugs(bugs)
    return redirect(url_for('index'))

@app.route('/update/<int:bug_id>/<status>')
def update_status(bug_id, status):
    bugs = load_bugs()
    for bug in bugs:
        if bug['id'] == bug_id:
            bug['status'] = status
            break
    save_bugs(bugs)
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
