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

    def __init__(self, **kwargs):
        self.content = kwargs.get('content')
        self.user_id = kwargs.get('user_id')

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
