import os
import redis
from flask import Flask, redirect, url_for
from flask_sqlalchemy import SQLAlchemy

USER = os.environ["USER"]
PASSWORD = os.environ["PASSWORD"]
HOST = os.environ["HOST"]
PORT = os.environ["PORT"]
DB = os.environ["DB"]

REDIS_HOST = os.environ["REDIS_HOST"]
REDIS_PORT = os.environ["REDIS_PORT"]

db = SQLAlchemy()
r = redis.Redis(host=REDIS_HOST, port=REDIS_PORT)

def create_app():
    app = Flask(__name__)
    app.config.from_mapping({
        "SQLALCHEMY_DATABASE_URI": f"postgresql+psycopg2://{USER}:{PASSWORD}@{HOST}/{DB}",
    })
 
    db.init_app(app)
    with app.app_context():
        db.reflect()

    import views
    app.register_blueprint(views.student_bp)
    app.register_blueprint(views.test_bp)
    app.register_blueprint(views.query_bp)
    
    @app.route("/", methods=["GET", "POST"])
    def rootredirect():
        return redirect(url_for("student.student_all"))

    return app