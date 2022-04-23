// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:eticaret/util/base/base_model.dart';

class ProductResponse extends BaseModel {
  ProductResponse({
    this.uuid,
    this.categoryUuid,
    this.smallImage,
    this.images,
    this.title,
    this.description,
    this.price,
    this.point,
    // this.optionTypes, // new
    // this.options, // changed
    this.sizeOptions,
    this.colorOptions,
    this.selectedSizeOption,
    this.selectedColorOption,

    // size_options:Optional[List[str]]
    // color_options:Optional[List[str]]
    // selected_size_option:Optional[str]
    // selected_color_option:Optional[str]

    // this.selectedOption,
    this.cartItemUuid,
  });

  String? uuid;
  String? categoryUuid;
  String? smallImage;
  List<String>? images;
  String? title;
  String? description;
  int? price;
  int? point;
  List<String>? sizeOptions;
  List<String>? colorOptions;
  String? selectedSizeOption;
  String? selectedColorOption;
  // List<OptionType>? optionTypes; // new
  // List<OptionResponse>? options; // Changed
  // OptionResponse? selectedOption;

  String? cartItemUuid;
  // Local Properties
  // Uint8List? smallPicture; // deleted
  // List<Uint8List>? bigPictures; // deleted
  bool isSelected = true;
  bool isLiked = true;

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
        "small_image": smallImage,
        "images":
            List<dynamic>.from((images != null) ? images!.map((x) => x) : []),
        "title": title,
        "description": description,
        "price": price,
        "point": point,
        // "option_types": List<dynamic>.from(
        //   (optionTypes != null)
        //       ? optionTypes!.map((x) => optionTypeValues.reverse[x])
        //       : [],
        // ), // new
        // "options": List<dynamic>.from(
        //   (options != null) ? options!.map((x) => x.toMap()) : [],
        // ), // changed
        // "selected_option": selectedOption,

        "size_options": List<dynamic>.from(
            (sizeOptions != null) ? sizeOptions!.map((x) => x) : []),
        "color_options": List<dynamic>.from(
            (colorOptions != null) ? colorOptions!.map((x) => x) : []),
        "selected_size_option": selectedSizeOption,
        "selected_color_option": selectedColorOption,
        "cart_item_uuid": cartItemUuid,
      },
    );
  }

  @override
  fromMap(Map<String, dynamic> map) {
    uuid = map["uuid"];
    categoryUuid = map["category_uuid"];
    smallImage = map["small_image"];
    images = List<String>.from(map["images"].map((x) => x));
    title = map["title"];
    description = map["description"];
    price = map["price"];
    point = map["point"];
    // optionTypes = List<OptionType>.from(
    //   map["option_types"].map((x) => optionTypeValues.map[x]),
    // );
    // options = List<OptionResponse>.from(
    //   map["options"].map((x) => OptionResponse()..fromMap(x)),
    // );
    // selectedOption = (map["selected_option"] != null)
    //     ? (OptionResponse()..fromMap(map["selected_option"]))
    //     : null;
    sizeOptions = List<String>.from(map["size_options"].map((x) => x));
    colorOptions = List<String>.from(map["color_options"].map((x) => x));
    selectedSizeOption = map["selected_size_option"];
    selectedColorOption = map["selected_color_option"];
    cartItemUuid = map["cart_item_uuid"];
  }
}

// class Option extends BaseModel {
//   Option({
//     this.size,
//     this.color,
//   });

//   int? size;
//   String? color;

//   @override
//   String toJson() {
//     return json.encode(
//       {
//         "size": size,
//         "color": color,
//       },
//     );
//   }

//   @override
//   fromJson(String jsonStr) {
//     fromMap(json.decode(jsonStr));
//   }

//   @override
//   fromMap(Map<String, dynamic> map) {
//     size = map["size"];
//     color = map["color"];
//   }
// }

// enum OptionType {
//   SHOES_NUMBER,
//   BODY_NUMBER,
//   WRIST_NUMBER,
//   COLOR,
//   SIZE,
//   MATERIAL
// }

// final optionTypeValues = EnumValues<OptionType>({
//   "BODY_NUMBER": OptionType.BODY_NUMBER,
//   "COLOR": OptionType.COLOR,
//   "MATERIAL": OptionType.MATERIAL,
//   "SHOES_NUMBER": OptionType.SHOES_NUMBER,
//   "SIZE": OptionType.SIZE,
//   "WRIST_NUMBER": OptionType.WRIST_NUMBER
// });

// class OptionResponse extends BaseModel {
//   OptionResponse({
//     this.type,
//     this.value,
//     this.options,
//   });

//   OptionType? type;
//   String? value;
//   List<OptionResponse>? options;

//   @override
//   fromJson(String jsonStr) {
//     fromMap(json.decode(jsonStr));
//   }

//   @override
//   fromMap(Map<String, dynamic> map) {
//     type = optionTypeValues.map[map["type"]];
//     value = map["value"];
//     options = List<OptionResponse>.from(
//         map["options"].map((x) => OptionResponse()..fromMap(x)));
//   }

//   @override
//   String toJson() {
//     return json.encode(toMap());
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       "type": optionTypeValues.reverse[type],
//       "value": value,
//       "options": List<dynamic>.from(
//         (options != null) ? options!.map((x) => x.toMap()) : [],
//       ),
//     };
//   }
// }

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String>? reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap ??= map.map((k, v) => MapEntry(v, k));
//     return reverseMap!;
//   }
// }
