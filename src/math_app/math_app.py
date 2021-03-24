from flask import jsonify, make_response

from math_app import app


@app.route("/", methods=['GET'])
def hello():
    return "Hello, world!\n"


@app.route("/add/<int:num1>/<int:num2>")
def add(num1, num2):
    response = {
        "num1": num1,
        "num2": num2,
        "num1 + num2": num1 + num2,
    }

    return make_response(jsonify(response), 200)

