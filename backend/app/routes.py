from app import app
from flask import render_template, redirect, url_for
from flask_login import login_required, current_user

@app.route('/')
def home():
    return "Welcome to the Garson-Isletme Backend!"

# Kullanıcıların yönlendirileceği sayfalar
@app.route('/login')
def login_page():
    return render_template('login.html')

@app.route('/register')
def register_page():
    return render_template('register.html')

@app.route('/dashboard')
@login_required
def dashboard_page():
    if current_user.role == 'garson':
        return render_template('garson_dashboard.html')
    elif current_user.role == 'isletme':
        return render_template('isletme_dashboard.html')
