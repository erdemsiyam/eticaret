from re import U
from fastapi import Depends, FastAPI,HTTPException,status
from fastapi.exceptions import HTTPException
from pydantic import BaseModel
from fastapi_jwt_auth import AuthJWT
import uuid
from typing import Optional

app = FastAPI()
# uvicorn main:app --reload

class User(BaseModel):
    uuid:Optional[str]
    username:Optional[str]
    email:Optional[str]
    password:Optional[str]
    access_token:Optional[str]
    refresh_token:Optional[str]

    class Config:
        schema_extra={
            "example":{
                "uuid":"uuid",
                "username":"erdem",
                "email":"erdem@erdem.com",
                "password":"password",
                "access_token":"str",
                "refresh_token":"str"
            }
        }
    
user1 = User()
user1.uuid="b0e27d14-f6c3-45e3-b9dc-da4c106cba75"
user1.username="erdem"
user1.email = "erdem@erdem.com"
user1.password = "123"
user2 = User()
user2.uuid="c0e27d14-f6c3-45e3-b9dc-da4c106cba75"
user2.username="siyam"
user2.email = "siyam@erdem.com"
user2.password = "123"
users:list[User] = [ user1, user2]

class Note(BaseModel):
    uuid:Optional[str]
    user_uuid:Optional[str]
    content:Optional[str]
    class Config:
        schema_extra={
            "example":{
                "uuid":"uuid",
                "user_uuid":"uuid",
                "content":"content"
            }
        }

note1 = Note()
note1.uuid = "a0e27d14-f6c3-45e3-b9dc-da4c106cba75"
note1.user_uuid = "b0e27d14-f6c3-45e3-b9dc-da4c106cba75"
note1.content = "erdem1"
note2 = Note()
note2.uuid = "a1e27d14-f6c3-45e3-b9dc-da4c106cba75"
note2.user_uuid = "b0e27d14-f6c3-45e3-b9dc-da4c106cba75"
note2.content = "erdem2"
note3 = Note()
note3.uuid = "a2e27d14-f6c3-45e3-b9dc-da4c106cba75"
note3.user_uuid = "c0e27d14-f6c3-45e3-b9dc-da4c106cba75"
note3.content = "siyam3"
notes:list[Note] = [note1,note2,note3]

# JWT Ayarı
class Settings(BaseModel):
    authjwt_secret_key:str = "f5747ed10eea1386427b8afa4a58cbf05e991857015bef2f0d7da047e98837d8"
@AuthJWT.load_config
def get_config():
    return Settings()

# Auth Methods
def check_auth(authorize:AuthJWT):
    try:
        authorize.jwt_required()
    except Exception as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED,detail="Invalid Token")
    
@app.get('/')
def index(authorize:AuthJWT=Depends()):
    check_auth(authorize=authorize)
    return {"message":True}

@app.post('/token')
def get_token(user:User,authorize:AuthJWT=Depends()):
    for u in users:
        if (user.username == u.username) and (user.password == u.password):
            user.uuid = u.uuid
            user.username = u.username
            user.email = u.email
            user.password = None
            user.access_token = authorize.create_access_token(subject=u.uuid) # token üretilir
            user.refresh_token = authorize.create_refresh_token(subject=u.uuid)
            return user
    return HTTPException(status_code='401',detail='Invalid Username or Password')

@app.get('/retoken')
def get_retoken(authorize:AuthJWT=Depends()):
    check_auth(authorize=authorize)
    current_user_uuid = authorize.get_jwt_subject()
    for u in users:
        if (u.uuid == current_user_uuid):
            user = User()
            user.uuid = u.uuid
            user.username = u.username
            user.email = u.email
            user.password = None
            user.access_token = authorize.create_access_token(subject=u.uuid) # token üretilir
            user.refresh_token = authorize.create_refresh_token(subject=u.uuid)
            return user
    return HTTPException(status_code='401',detail='Invalid Username or Password')

@app.post('/signup',status_code=201)
def signup(user:User,authorize:AuthJWT=Depends()):
    user.uuid = str(uuid.uuid4())
    users.append(user)
    return get_token(user=user,authorize=authorize)


# Note Methods
@app.get('/notes')
def get_notes(authorize:AuthJWT=Depends()):
    check_auth(authorize)
    return notes

@app.get('/note/{uuid}')
def get_note(uuid:str,authorize:AuthJWT=Depends()):
    check_auth(authorize)
    for n in notes:
        if n.uuid == uuid:
            return n

@app.post('/note')
def create_note(note:Note,authorize:AuthJWT=Depends()):
    check_auth(authorize)
    note.user_uuid = authorize.get_jwt_subject() # Owner User UUID
    note.uuid = str(uuid.uuid4())
    notes.append(note)
    return note

@app.put('/note')
def update_note(note:Note,authorize:AuthJWT=Depends()):
    check_auth(authorize)
    current_user_uuid = authorize.get_jwt_subject()
    for n in notes:
        if n.uuid == note.uuid and n.user_uuid == current_user_uuid:
            n.content = note.content
            return {"message":True}
    return {"message":False}

@app.delete('/note/{uuid}')
def delete_note(uuid:str,authorize:AuthJWT=Depends()):
    check_auth(authorize)
    current_user_uuid = authorize.get_jwt_subject()
    for n in notes:
        if n.uuid == uuid and n.user_uuid == current_user_uuid:
            notes.remove(n)
            return {"message":True}
    return {"message":False}