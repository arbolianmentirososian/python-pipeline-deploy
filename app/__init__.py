from flask import Flask
from flask_wtf.csrf import CSRFProtect


app = Flask(__name__)
app.config['JSON_SORT_KEYS'] = True
csrf = CSRFProtect(app)
    
from .views import math_view
