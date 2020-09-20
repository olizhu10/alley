from db import db, User, Post, Tip, Tag

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
    user = User.query.filter_by(id=user_id).first()
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
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return None
    db.session.delete(user)
    db.session.commit()
    return user.serialize()

# ----POSTS----------------------------------------------------------------------


def get_all_posts():
    return [p.serialize() for p in Post.query.all()]


def get_post_by_id(post_id):
    post = Post.query.filter_by(id=post_id).first()
    if post is None:
        return None
    return post.serialize()


def create_post(content, user_id):
    new_post = Post(
        content=content,
        user_id=user_id
    )

    db.session.add(new_post)
    db.session.commit()
    return new_post.serialize()


def delete_post_by_id(post_id):
    post = Post.query.filter_by(id=post_id).first()
    if post is None:
        return None
    db.session.delete(post)
    db.session.commit()
    return post.serialize()

# ----TIPS-----------------------------------------------------------------------


def get_tips():
    return [t.serialize() for t in Tip.query.all()]


def get_tip_by_id(tip_id):
    tip = Tip.query.filter_by(id=tip_id).first()
    if tip is None:
        return None
    return tip.serialize()


def create_tip(title, content):
    new_tip = Tip(
        title=title,
        content=content
    )

    db.session.add(new_tip)
    db.session.commit()
    return new_tip.serialize()


def delete_tip_by_id(tip_id):
    tip = Tip.query.filter_by(id=tip_id).first()
    if tip is None:
        return None
    db.session.delete(tip)
    db.session.commit()
    return tip.serialize()

# ----TAGS----------------------------------------------------------------------


def get_all_tags():
    return [t.serialize() for t in Tag.query.all()]


def create_tag(label):
    new_tag = Tag(
        label=label
    )

    db.session.add(new_tag)
    db.session.commit()
    return new_tag.serialize()


def get_tag_by_id(tag_id):
    tag = Tag.query.filter_by(id=tag_id).first()
    if tag is None:
        return None
    return tag.serialize()


def update_tag_by_id(tag_id, label):
    tag = Tag.query.filter_by(id=tag_ud).first()
    if tag is None:
        return None
    if label is not None:
        tag.label = label

    db.session.commit()
    return tag.serialize()


def delete_tag_by_id(tag_id):
    tag = Tag.query.filter_by(id=tag_id).first()
    if tag is None:
        return None
    db.session.delete(tag)
    db.session.commit()
    return tag.serialize()
