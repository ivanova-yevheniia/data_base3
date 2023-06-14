import uuid
import pickle
from app import db, r
from sqlalchemy.sql import func
from models import Student, SexType, Location, Test, TestStatus, TestSubject, Location

# Student services
def serialize_student_all():
    students = db.session.execute(db.select(Student).order_by(Student.birth.asc()).limit(40)).scalars()
    students = list(students)
    return students

def serialize_student(uuid):
    student = db.one_or_404(db.select(Student).filter(Student.outid == uuid))
    return student

def serialize_student_options():
    sextype = list(db.session.execute(db.select(SexType)).scalars())
    location = list(db.session.execute(db.select(Location)).scalars())
    return {
        "sextype": sextype,
        "location": location,
    }

def create_student(form):
    data = dict(form)
    data["outid"] = uuid.uuid4()
    db.session.add(Student(**data))
    db.session.commit()

def update_student(uuid, form):
    data = dict(form)
    data = {k:v for k,v in data.items() if v}
    db.session.execute(db.update(Student).filter(Student.outid == uuid).values(**data))
    db.session.commit()
            
def delete_student(uuid):
    student = db.one_or_404(db.select(Student).filter(Student.outid == uuid))
    db.session.delete(student)
    db.session.commit()

def serialize_student_columns(exclude=None):
    cols = list(map(lambda c: c.name, Student.__table__.columns))
    cols = [i if i != "sextype_id" else "sextype" for i in cols]
    cols = [i if i != "location_id" else "location" for i in cols]
    if exclude is not None:
        cols = list(filter(lambda x: x not in exclude, cols))
    return cols


# Test services
def serialize_test_all(student_uuid):
    tests = db.session.execute(db.select(Test).filter(Test.outid == student_uuid)).scalars()
    return tests

def serialize_test(id):
    id = int(id)
    test = db.one_or_404(db.select(Test).filter(Test.id == id))
    return test

def serialize_test_options():
    status = list(db.session.execute(db.select(TestStatus)).scalars())
    subject = list(db.session.execute(db.select(TestSubject)).scalars())
    location = list(db.session.execute(db.select(Location)).scalars())
    return {
        "status": status,
        "subject": subject,
        "location": location
    }

def serialize_test_columns(exclude=None):
    cols = list(map(lambda c: c.name, Test.__table__.columns))
    cols = [i if i != "subject_id" else "subject" for i in cols]
    cols = [i if i != "status_id" else "status" for i in cols]
    cols = [i if i != "location_id" else "location" for i in cols]
    if exclude:
        cols = list(filter(lambda x: x not in exclude, cols))
    return cols

def create_test(student_uuid, form):
    data = dict(form)
    test = Test(**data)
    student = serialize_student(student_uuid)
    student.tests.append(test)
    db.session.add(student)
    db.session.commit()
        
def update_test(id, form):
    data = dict(form)
    data = {k:v for k,v in data.items() if v}
    db.session.execute(db.update(Test).filter(Test.id == id).values(**data))
    db.session.commit()
    
def delete_test(id):
    id = int(id)
    test = db.one_or_404(db.select(Test).filter(Test.id == id))
    db.session.delete(test)
    db.session.commit()
    
def query(form):
    data = dict(form)
    
    if res := r.get(str(data)):
        res = pickle.loads(res)
        return res
    
    res = db.session.execute(
        db.select(Test.year, Location.name.label("location"), func.avg(Test.ball100).label("bavg"))
        .join(Location)
        .where(
            (Test.ball100 >= 100),
            (Test.location_id == int(data.get("location_id")) if data.get("location_id") else True),
            (Test.subject_id == int(data.get("subject_id")) if data.get("subject_id") else True),
            (Test.year == int(data.get("year")) if data.get("year") else True),
        ).group_by(Test.year, Location.name)
    ).mappings()
    res = list(res)
            
    
    r.set(str(data), pickle.dumps(res))
    
    return res