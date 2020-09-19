from db import db, User, Post, Tip

# ----USERS----------------------------------------------------------------------


def get_all_users():
    return [u.serialize() for u in User.query.all()]


def create_user(name):
    new_user = User(
        name=name
    )

    db.session.add(new_user)
    db.session.commit()
    return new_user.serialize()


def get_user_by_id(user_id):
    user = User.query.filter_by(id=user_ud).first()
    if user is None:
        return None
    return user.serialize()


def update_user_by_id(user_id, name):
    user = User.query.filter_by(id=user_ud).first()
    if user is None:
        return None
    if name is not None:
        user.name = name

    db.session.commit()
    return user.serialize()


def delete_user_by_id(user_id):
    def get_user_by_id(user_id):
        user = User.query.filter_by(id=user_ud).first()
        if user is None:
            return None
        db.session.delete(user)
        db.session.commit()
        return user.serialize()

# ----POSTS----------------------------------------------------------------------


def create_post(content, user_id):
    new_post = Post(
        content=content,
        user_id=user_id
    )

    db.session.add(new_post)
    db.session.commit()
    return new_post.serialize()


# ----TIPS-----------------------------------------------------------------------
