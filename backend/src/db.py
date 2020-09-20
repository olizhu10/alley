from flask_sqlalchemy import SQLAlchemy
import json


db = SQLAlchemy()


class User(db.Model):
    __tablename__ = 'user'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    posts = db.relationship('Post', cascade='delete')

    def __init__(self, **kwargs):
        self.name = kwargs.get('name', '')

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'posts': [p.serialize() for p in self.posts]
        }


class Post(db.Model):
    __tablename__ = 'post'
    id = db.Column(db.Integer, primary_key=True)
    content = db.Column(db.String, nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    tag_id = db.Column(db.String, db.ForeignKey('tag.id'), nullable=False)

    def __init__(self, **kwargs):
        self.content = kwargs.get('content')
        self.user_id = kwargs.get('user_id')
        self.tag_id = kwargs.get('tag_id')

    def serialize(self):
        return {
            'id': self.id,
            'content': self.content
        }


class Tip(db.Model):
    __tablename__ = 'tip'
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String, nullable=False)
    content = db.Column(db.String, nullable=False)

    def __init__(self, **kwargs):
        self.title = kwargs.get('title')
        self.content = kwargs.get('content')

    def serialize(self):
        return {
            'id': self.id,
            'title': self.title,
            'content': self.content
        }


class Tag(db.Model):
    __tablename__ = 'tag'
    id = db.Column(db.Integer, primary_key=True)
    label = db.Column(db.String, nullable=False)
    posts = db.relationship('Post')

    def __init__(self, **kwargs):
        self.label = kwargs.get('label')

    def serialize(self):
        return {
            'id': self.id,
            'label': self.label,
            'posts': [p.serialize() for p in self.posts]
        }
