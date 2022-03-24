// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';
import 'dart:typed_data';

import 'package:eticaret/util/base/base_model.dart';

class Product extends BaseModel {
  Product({
    this.uuid,
    this.categoryUuid,
    this.smallPictureUuid,
    this.pictures,
    this.title,
    this.description,
    this.price,
    this.point,
    this.options,
    this.selectedOption,
    this.cartItemUuid,
  });

  String? uuid;
  String? categoryUuid;
  String? smallPictureUuid;
  List<String>? pictures;
  String? title;
  String? description;
  int? price;
  int? point;
  List<Option>? options;
  Option? selectedOption;
  String? cartItemUuid;
  // Local Properties
  Uint8List? picture;

  @override
  fromJson(String jsonStr) {
    fromMap(json.decode(jsonStr));
  }

  @override
  String toJson() {
    return json.encode(
      {
        "uuid": uuid,
        "category_uuid": categoryUuid,
        "small_picture_uuid": smallPictureUuid,
        "pictures": List<dynamic>.from(
            (pictures != null) ? pictures!.map((x) => x) : []),
        "title": title,
        "description": description,
        "price": price,
        "point": point,
        "options": List<dynamic>.from(
            (options != null) ? options!.map((x) => x.toJson()) : []),
        "selected_option": selectedOption,
        "cart_item_uuid": cartItemUuid,
      },
    );
  }

  @override
  fromMap(Map<String, dynamic> map) {
    uuid = map["uuid"];
    categoryUuid = map["category_uuid"];
    smallPictureUuid = map["small_picture_uuid"];
    pictures = List<String>.from(map["pictures"].map((x) => x));
    title = map["title"];
    description = map["description"];
    price = map["price"];
    point = map["point"];
    options =
        List<Option>.from(map["options"].map((x) => Option()..fromMap(x)));
    selectedOption = (map["selected_option"] != null)
        ? (Option()..fromMap(map["selected_option"]))
        : null;
    cartItemUuid = map["cart_item_uuid"];
  }
}

class Option extends BaseModel {
  Option({
    this.size,
    this.color,
  });

  int? size;
  String? color;

  @override
  String toJson() {
    return json.encode(
      {
        "size": size,
        "color": color,
      },
    );
  }

  @override
  fromJson(String jsonStr) {
    fromMap(json.decode(jsonStr));
  }

  @override
  fromMap(Map<String, dynamic> map) {
    size = map["size"];
    color = map["color"];
  }
}
