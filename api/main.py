from distutils import core
from re import U
from urllib import response
from fastapi import Depends, FastAPI,HTTPException,status
from fastapi.responses import FileResponse
from fastapi.exceptions import HTTPException
from pydantic import BaseModel
from fastapi_jwt_auth import AuthJWT
import uuid
from typing import Optional
import os

IMAGEDIR = os.path.abspath(os.getcwd()) + '/images/'

app = FastAPI()
#uvicorn main:app --reload

# REPOSITORY
class User(BaseModel):
    uuid:Optional[str]
    username:Optional[str]
    password:Optional[str]
    email:Optional[str]
    access_token:Optional[str]
    refresh_token:Optional[str]
users:list[User] = []
user1 = User()
user1.uuid="b0e27d14-f6c3-45e3-b9dc-da4c106cba75"
user1.username="erdem"
user1.email = "erdem@erdem.com"
user1.password = "123"
users.append(user1)
user2 = User()
user2.uuid="c0e27d14-f6c3-45e3-b9dc-da4c106cba75"
user2.username="siyam"
user2.email = "siyam@erdem.com"
user2.password = "123"
users.append(user2)

class Picture(BaseModel):
    uuid:Optional[str]
    name:Optional[str]
pictures = []
for i in range(1,31):
    pic = Picture()
    pic.uuid = str(i)
    pic.name = pic.uuid + '.jpg'
    pictures.append(pic)

class Category(BaseModel):
    uuid:Optional[str]
    picture_uuid:Optional[str]
    title:Optional[str]
categories = []
cat1 = Category()
cat1.uuid = "1"
cat1.picture_uuid = "1"
cat1.title = "Sneakers"
categories.append(cat1)
cat2 = Category()
cat2.uuid = "2"
cat2.picture_uuid = "2"
cat2.title = "Jacket"
categories.append(cat2)
cat3 = Category()
cat3.uuid = "3"
cat3.picture_uuid = "3"
cat3.title = "Watch"
categories.append(cat3)


class Option(BaseModel):
    size:Optional[int]
    color:Optional[str]
    
    @classmethod
    def custom_init(cls, size:Optional[int], color:Optional[str]):
        return cls(size=size, color=color)

class Item(BaseModel):
    uuid:Optional[str]
    category_uuid:Optional[str]
    small_picture_uuid:Optional[str]
    pictures:Optional[list[str]]
    title:Optional[str]
    description:Optional[str]
    price:Optional[float]
    point:Optional[int]
    options:Optional[list[Option]]
    selected_option:Optional[Option] # Sepet için eklenildi, kolaylık olsun diye
    cart_item_uuid:Optional[str] # Sepete eklenirse, o sepetteki idsi buraya koyulur, sadece sepet için eklenildi bu alan kolaylık olsun diye
items:list[Item] = []
item1 = Item()
item1.uuid = "4"
item1.category_uuid = "1"
item1.small_picture_uuid = "4"
item1.pictures = ["5","6"]
item1.title = "Shoes 1"
item1.description = "Shoes 1 Description"
item1.price = 100
item1.point = 3
item1.options = [Option.custom_init(40,"blue"),Option.custom_init(40,"red"),Option.custom_init(41,"black")]
items.append(item1)
item2 = Item()
item2.uuid = "5"
item2.category_uuid = "1"
item2.small_picture_uuid = "7"
item2.pictures = ["8","9"]
item2.title = "Shoes 2"
item2.description = "Shoes 2 Description"
item2.price = 200
item2.point = 4
item2.options = [Option.custom_init(40,"orange"),Option.custom_init(40,"pink"),Option.custom_init(41,"white")]
items.append(item2)
item3 = Item()
item3.uuid = "6"
item3.category_uuid = "1"
item3.small_picture_uuid = "10"
item3.pictures = ["11","12"]
item3.title = "Shoes 3"
item3.description = "Shoes 3 Description"
item3.price = 250
item3.point = 5
item3.options = [Option.custom_init(39,"orange"),Option.custom_init(41,"yellow"),Option.custom_init(44,"black")]
items.append(item3)
item4 = Item()
item4.uuid = "7"
item4.category_uuid = "2"
item4.small_picture_uuid = "13"
item4.pictures = ["14","15"]
item4.title = "Jacket 1"
item4.description = "Jacket 1 Description"
item4.price = 300
item4.point = 3
item4.options = [Option.custom_init(60,"Medium"),Option.custom_init(54,"Small"),Option.custom_init(64,"Large")]
items.append(item4)
item5 = Item()
item5.uuid = "8"
item5.category_uuid = "2"
item5.small_picture_uuid = "16"
item5.pictures = ["17","18"]
item5.title = "Jacket 2"
item5.description = "Jacket 2 Description"
item5.price = 350
item5.point = 4
item5.options = [Option.custom_init(60,"Medium"),Option.custom_init(54,"Small"),Option.custom_init(64,"Large")]
items.append(item5)
item6 = Item()
item6.uuid = "9"
item6.category_uuid = "2"
item6.small_picture_uuid = "19"
item6.pictures = ["20","21"]
item6.title = "Jacket 3"
item6.description = "Jacket 3 Description"
item6.price = 400
item6.point = 5
item6.options = [Option.custom_init(60,"Medium"),Option.custom_init(54,"Small"),Option.custom_init(64,"Large")]
items.append(item6)
item7 = Item()
item7.uuid = "10"
item7.category_uuid = "3"
item7.small_picture_uuid = "22"
item7.pictures = ["23","24"]
item7.title = "Watch 1"
item7.description = "Watch 1 Description"
item7.price = 120
item7.point = 3
item7.options = [Option.custom_init(10,"Gold"),Option.custom_init(12,"Silver"),Option.custom_init(11,"Platinium")]
items.append(item7)
item8 = Item()
item8.uuid = "11"
item8.category_uuid = "3"
item8.small_picture_uuid = "25"
item8.pictures = ["26","27"]
item8.title = "Watch 2"
item8.description = "Watch 2 Description"
item8.price = 160
item8.point = 4
item8.options = [Option.custom_init(10,"Gold"),Option.custom_init(12,"Silver"),Option.custom_init(11,"Platinium")]
items.append(item8)
item9 = Item()
item9.uuid = "12"
item9.category_uuid = "3"
item9.small_picture_uuid = "28"
item9.pictures = ["29","30"]
item9.title = "Watch 3"
item9.description = "Watch 3 Description"
item9.price = 180
item9.point = 5
item9.options = [Option.custom_init(10,"Gold"),Option.custom_init(12,"Silver"),Option.custom_init(11,"Platinium")]
items.append(item9)

class Favorite(BaseModel):
    user_uuid:Optional[str]
    item_uuid:Optional[str]
favorites:list[Favorite] = []
class CartItem(BaseModel):
    uuid:Optional[str]
    item_uuid:Optional[str]
    selected_option:Optional[Option]
cart_items:list[CartItem] = []
class Cart(BaseModel):
    user_uuid:Optional[str]
    cart_item_uuids:Optional[list[str]]
carts:list[Cart] = []



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
def token(user:User,authorize:AuthJWT=Depends()):
    for u in users:
        if (user.username == u.username) and (user.password == u.password):
            u.access_token = authorize.create_access_token(subject=u.uuid) # token üretilir
            u.refresh_token = authorize.create_refresh_token(subject=u.uuid)
            response_user = u.copy()
            response_user.password = None
            return response_user
    return HTTPException(status_code='401',detail='Invalid Username or Password')

@app.get('/refresh_token')
def refresh_token(authorize:AuthJWT=Depends()):
    try:
        authorize.jwt_refresh_token_required()
    except Exception as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED,detail="Invalid Token")
    current_user_uuid = authorize.get_jwt_subject()
    for u in users:
        if (u.uuid == current_user_uuid):
            user = User()
            user.uuid = u.uuid
            user.username = u.username
            user.email = u.email
            user.password = None
            user.access_token = authorize.create_access_token(subject=u.uuid) # token üretilir
            user.refresh_token = u.refresh_token
            return user
    return HTTPException(status_code='401',detail='Invalid Username or Password')

@app.post('/signup',status_code=201)
def signup(user:User,authorize:AuthJWT=Depends()):
    user.uuid = str(uuid.uuid4())
    users.append(user)
    return token(user=user,authorize=authorize)


# Methods
@app.get('/items')
def get_items(category_id:Optional[int] = None,search:Optional[str] = None):
    response_items:list[Item] = []
    
    # Category Query
    if category_id is None:
        response_items = items
    else:
        for i in items:
            if i.category_uuid == category_id:
                response_items.append(i)
    
    # Search Query
    if search is not None:
        for i in response_items.copy():
            if search not in i.title and search not in i.description:
                response_items.remove(i)

    return response_items

@app.get('/categories')
def get_categories():
    return categories

@app.get('/item/{item_uuid}')
def get_item_by_id(item_uuid:str):
    for i in items:
        if i.uuid == item_uuid:
            return i
    return {}

@app.get("/picture/{uuid}")
async def get_picture_by_id(uuid:str):
    for i in pictures:
        if i.uuid == uuid:
            return FileResponse(IMAGEDIR+i.name)
    return {}

@app.get('/favorites/')
def get_favories_by_user(authorize:AuthJWT=Depends()):
    check_auth(authorize)
    current_user_uuid = authorize.get_jwt_subject()
    response_list:list[Item] = []
    for i in favorites:
        if i.user_uuid == current_user_uuid:
            for x in items:
                if x.uuid == i.item_uuid:
                    response_list.append(x)
    return response_list

@app.get('/cart/')
def get_cart_by_user(authorize:AuthJWT=Depends()):
    check_auth(authorize)
    current_user_uuid = authorize.get_jwt_subject()
    response_list:list[Item] = []
    for i in carts:
        if i.user_uuid == current_user_uuid:
            for x in i.cart_item_uuids:
                for y in cart_items:
                    if x == y.uuid:
                        for z in items:
                            if z.uuid == y.item_uuid:
                                item = z.copy()
                                item.cart_item_uuid = y.uuid
                                item.selected_option = y.selected_option
                                response_list.append(item)
    return response_list

@app.post('/favorite/{item_uuid}')
def add_fovorite(item_uuid:str,authorize:AuthJWT=Depends()):
    check_auth(authorize)
    current_user_uuid = authorize.get_jwt_subject()
    for i in items:
        if i.uuid == item_uuid:
            favorite:Favorite = Favorite()
            favorite.user_uuid = current_user_uuid
            favorite.item_uuid = i.uuid
            favorites.append(favorite)
            return True
    return False

@app.post('/cart/')
def add_cart(item:Item,authorize:AuthJWT=Depends()):
    check_auth(authorize)
    current_user_uuid = authorize.get_jwt_subject()
    for i in items:
        if i.uuid == item.uuid:
            for x in carts:
                if x.user_uuid == current_user_uuid:
                    cart_item = CartItem()
                    cart_item.uuid = str(uuid.uuid4())
                    cart_item.item_uuid = item.uuid
                    cart_item.selected_option = item.selected_option
                    cart_items.append(cart_item)
                    x.cart_item_uuids.append(cart_item.uuid)
                    return True
                    
            cart_item = CartItem()
            cart_item.uuid = str(uuid.uuid4())
            cart_item.item_uuid = item.uuid
            cart_item.selected_option = item.selected_option
            cart_items.append(cart_item)
            cart = Cart()
            cart.user_uuid = current_user_uuid
            cart.cart_item_uuids = [cart_item.uuid]
            carts.append(cart)
            return True
    return False

@app.delete('/favorite/{item_uuid}')
def delete_favorite(item_uuid:str,authorize:AuthJWT=Depends()):
    check_auth(authorize)
    current_user_uuid = authorize.get_jwt_subject()
    for i in favorites:
        if i.user_uuid == current_user_uuid and i.item_uuid == item_uuid:
            favorites.remove(i)
            return True
    return False


@app.delete('/cart/{cart_item_uuid}')
def delete_cart(cart_item_uuid:str,authorize:AuthJWT=Depends()):
    check_auth(authorize)
    current_user_uuid = authorize.get_jwt_subject()
    for i in carts:
        if i.user_uuid == current_user_uuid:
            for x in i.cart_item_uuids:
                if x == cart_item_uuid:
                    for y in cart_items:
                        if y.uuid == cart_item_uuid:
                            cart_items.remove(y)
                            i.cart_item_uuids.remove(cart_item_uuid)
                            return True
    return False

