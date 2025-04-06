from app import app, db
from flask import request, jsonify
from app.models import User
from flask_login import login_user
from werkzeug.security import generate_password_hash, check_password_hash

# Kullanıcı kaydını al
@app.route('/register', methods=['POST'])
def register():
    data = request.get_json()
    username = data['username']
    password = data['password']
    role = data['role']
    
    if User.query.filter_by(username=username).first():
        return jsonify({"message": "User already exists!"}), 400
    
    hashed_password = generate_password_hash(password, method='sha256')
    new_user = User(username=username, password=hashed_password, role=role)
    db.session.add(new_user)
    db.session.commit()
    
    return jsonify({"message": "User registered successfully!"}), 201

# Kullanıcı giriş
@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    username = data['username']
    password = data['password']
    
    user = User.query.filter_by(username=username).first()
    if not user or not check_password_hash(user.password, password):
        return jsonify({"message": "Invalid credentials!"}), 401
    
    login_user(user)
    return jsonify({"message": "Login successful!"}), 200
