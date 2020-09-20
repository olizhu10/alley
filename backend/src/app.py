import json
from flask import Flask, request
from db import db, User, Post, Tip, Tag
import dao


db_filename = "alley.db"
app = Flask(__name__)

# setup config
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///%s' % db_filename
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
    try:
        return success_response(dao.get_all_users())
    except Exception as e:
        return json.dumps({
            'success': False,
            'error': 'Exception: ' + str(e)
        }), 400


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


@app.route("/posts/<int:post_id>/")
def get_post(post_id):
    post = dao.get_post_by_id(post_id)
    if post is None:
        return failure_response("Post not found!")
    return success_response(post)


@app.route("/posts/", methods=["POST"])
def create_post():
    try:
        body = json.loads(request.data)
        post = dao.create_post(
            content=body.get('content'),
            user_id=body.get('user_id'),
            tag_id=body.get('tag_id')
        )
        return success_response(post, 201)
    except Exception as e:
        return json.dumps({
            'success': False,
            'error': 'Exception: ' + str(e)
        }), 400


@app.route("/posts/<int:post_id>/", methods=["POST"])
def update_post(post_id):
    post = Post.query.filter_by(id=post_id).first()
    if post is None:
        return failure_response("Post not found!")

    body = json.loads(request.data)
    post.content = body.get('content', post.content)

    db.session.commit()
    return success_response(post.serialize())


@app.route("/posts/<int:post_id>/", methods=["DELETE"])
def delete_post(post_id):
    post = Post.query.filter_by(id=post_id).first()
    if post is None:
        return failure_response("Post not found!")
    db.session.delete(post)
    db.session.commit()
    return success_response(post.serialize())


# ----TAG ROUTES----

@app.route("/tags/")
def get_tags():
    try:
        return success_response(dao.get_all_tags())
    except Exception as e:
        return json.dumps({
            'success': False,
            'error': 'Exception: ' + str(e)
        }), 400


@app.route("/tags/<int:tag_id>/")
def get_tag(tag_id):
    try:
        tag = dao.get_tag_by_id(tag_id)
        if tag is None:
            return failure_response("Tag not found!")
        return success_response(tag)
    except Exception as e:
        return json.dumps({
            'success': False,
            'error': 'Exception: ' + str(e)
        }), 400


@app.route("/tags/", methods=["POST"])
def create_tag():
    try:
        body = json.loads(request.data)
        tag = dao.create_tag(
            label=body.get('label')
        )
        return success_response(tag, 201)
    except Exception as e:
        return json.dumps({
            'success': False,
            'error': 'Exception: ' + str(e)
        }), 400


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
