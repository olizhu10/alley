import json
from flask import Flask, request
from db import db, User, Post, Tip
import dao


db_filename = "alley.db"
app = Flask(__name__)

# setup config
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///{db_filename}'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True

# initialize app
db.init_app(app)
with app.app_context():
    db.create_all()

# generalized response formats


def success_response(data, code=200):
    return json.dumps({"success": True, "data": data}), code


def failure_response(message, code=404):
    return json.dumps({"success": False, "error": message}), code


@app.route("/")
def hello_world():
    return "Hello world!"


# ----USER ROUTES----

@app.route("/users/")
def get_users():
    return success_response(dao.get_all_users())


@app.route("/users/<int:user_id>/")
def get_user(user_id):
    try:
        user = dao.get_user_by_id(user_id)
        if user is None:
            return failure_response("User not found!")
        return success_response(user)
    except Exception as e:
        return json.dumps({
            'success': False,
            'error': 'Exception: ' + str(e)
        }), 400


@app.route("/users/", methods=["POST"])
def create_user():
    try:
        body = json.loads(request.data)
        print(body)
        user = dao.create_user(
            name=body.get('name')
        )
        return success_response(user, 201)
    except Exception as e:
        return json.dumps({
            'success': False,
            'error': 'Exception: ' + str(e)
        }), 400

# ----POST ROUTES----


@app.route("/posts/")
def get_posts():
    return success_response(dao.get_all_posts(), 201)


@app.route("/posts/<int:post_id>")
def get_post(post_id):
    post = dao.get_post_by_id(post_id)
    if post is None:
        return failure_response("Post not found!")
    return success_response(post)


@app.route("/posts/", methods=["POST"])
def create_post():
    body = json.loads(request.data)
    post = dao.create_post(
        content=body.get('content'),
        user_id=body.get('user_id')
    )
    return success_response(post, 201)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
