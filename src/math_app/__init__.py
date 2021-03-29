from flask import Flask
 from flask_wtf.csrf import CSRFProtect

app = Flask(__name__)
app.config['JSON_SORT_KEYS'] = False

 csrf = CSRFProtect(app)
 

from math_app import math_app