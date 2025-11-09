from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import os

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///data/bugs.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

# Bug Model
class Bug(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(200), nullable=False)
    description = db.Column(db.Text, nullable=False)
    status = db.Column(db.String(50), default='Open')
    priority = db.Column(db.String(50), default='Medium')
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    
    def __repr__(self):
        return f'<Bug {self.id}: {self.title}>'

# Create database tables
with app.app_context():
    db.create_all()

@app.route('/')
def index():
    bugs = Bug.query.order_by(Bug.created_at.desc()).all()
    return render_template('index.html', bugs=bugs)

@app.route('/add', methods=['GET', 'POST'])
def add_bug():
    if request.method == 'POST':
        title = request.form['title']
        description = request.form['description']
        priority = request.form['priority']
        
        new_bug = Bug(title=title, description=description, priority=priority)
        db.session.add(new_bug)
        db.session.commit()
        
        return redirect(url_for('index'))
    
    return render_template('add_bug.html')

@app.route('/update/<int:id>', methods=['POST'])
def update_status(id):
    bug = Bug.query.get_or_404(id)
    bug.status = request.form['status']
    db.session.commit()
    return redirect(url_for('index'))

@app.route('/delete/<int:id>')
def delete_bug(id):
    bug = Bug.query.get_or_404(id)
    db.session.delete(bug)
    db.session.commit()
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=False)
