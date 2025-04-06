from app import app
from flask import render_template
from flask_login import login_required, current_user

# Garson ve işletme için farklı dashboard sayfaları
@app.route('/dashboard')
@login_required
def dashboard():
    if current_user.role == 'garson':
        return render_template('garson_dashboard.html')
    elif current_user.role == 'isletme':
        return render_template('isletme_dashboard.html')
