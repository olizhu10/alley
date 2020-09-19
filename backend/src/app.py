import json
from flask import Flask, request
from db import db, User, Post, Tip

app = Flask(__name__)
db_filename = 'app.db'


@app.route("/")
def hello_world():
    return "Hello world!"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
