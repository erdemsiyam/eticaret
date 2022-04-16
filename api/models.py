from distutils import core
from re import U
from urllib import response
from fastapi import Depends, FastAPI,HTTPException,status,File,UploadFile
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
from fastapi.exceptions import HTTPException
from pydantic import BaseModel
from fastapi_jwt_auth import AuthJWT
import uuid
from typing import Optional,List
import os


class User(BaseModel):
    uuid:Optional[str]
    username:Optional[str]
    password:Optional[str]
    email:Optional[str]
    access_token:Optional[str]
    refresh_token:Optional[str]


class Category(BaseModel):
    uuid:Optional[str]
    image:Optional[str]
    title:Optional[str]


class Option(BaseModel):
    type:Optional[str]
    value:Optional[str]
    options:Optional[List[object]]
    @classmethod
    def custom_init(cls, new_value:Optional[str], new_options: Optional[List[object]] = []):
        return cls(value=new_value,options = new_options)
class OptionTypes:
    SHOES_NUMBER = "SHOES_NUMBER"
    BODY_NUMBER = "BODY_NUMBER"
    WRIST_NUMBER = "WRIST_NUMBER"
    SIZE = "SIZE"
    COLOR = "COLOR"
    MATERIAL = "MATERIAL"
class ShoesNumberOption(Option):
    type = OptionTypes.SHOES_NUMBER
class BodyNumberOption(Option):
    type = OptionTypes.BODY_NUMBER
class WristNumberOption(Option):
    type = OptionTypes.WRIST_NUMBER
class SizeOption(Option):
    type = OptionTypes.SIZE
class ColorOption(Option):
    type = OptionTypes.COLOR
class MaterialOption(Option):
    type = OptionTypes.MATERIAL
class Sizes:
    SMALL = "SMALL"
    MEDIUM = "MEDIUM"
    LARGE = "LARGE"
    XLARGE = "XLARGE"
class Numbers:
    N10 = "10"
    N11 = "11"
    N12 = "12"
    N36 = "36"
    N38 = "38"
    N39 = "39"
    N40 = "40"
    N41 = "41"
    N42 = "42"
    N44 = "44"
    N54 = "54"
    N60 = "60"
    N64 = "64"
class Colors:
    BLUE = "BLUE"
    RED = "RED"
    WHITE = "WHITE"
    ORANGE = "ORANGE"
    BLACK = "BLACK"
    PINK = "PINK"
    YELLOW = "YELLOW"
class Materials:
    GOLD = "GOLD"
    PLATINIUM = "PLATINIUM"
    SILVER = "SILVER"


class Item(BaseModel):
    uuid:Optional[str]
    category_uuid:Optional[str]
    small_image:Optional[str]
    images:Optional[List[str]]
    title:Optional[str]
    description:Optional[str]
    price:Optional[float]
    point:Optional[int]
    # options:Optional[list[Option]]
    # selected_option:Optional[Option] # Sepet için eklenildi, kolaylık olsun diye
    option_types:Optional[List[str]]
    options:Optional[List[Option]]
    selected_option:Optional[Option]
    cart_item_uuid:Optional[str] # Sepete eklenirse, o sepetteki idsi buraya koyulur, sadece sepet için eklenildi bu alan kolaylık olsun diye


class Favorite(BaseModel):
    user_uuid:Optional[str]
    item_uuid:Optional[str]


class CartItem(BaseModel):
    uuid:Optional[str]
    item_uuid:Optional[str]
    selected_option:Optional[Option]


class Cart(BaseModel):
    user_uuid:Optional[str]
    cart_item_uuids:Optional[list[str]]