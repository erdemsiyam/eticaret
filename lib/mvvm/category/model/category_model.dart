import 'dart:convert';
import 'dart:typed_data';
import 'package:eticaret/util/base/base_model.dart';

class Category extends BaseModel {
  Category({
    this.uuid,
    this.pictureUuid,
    this.title,
  });

  String? uuid;
  String? pictureUuid;
  String? title;
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
        "picture_uuid": pictureUuid,
        "title": title,
      },
    );
  }

  @override
  fromMap(Map<String, dynamic> map) {
    uuid = map["uuid"];
    pictureUuid = map["picture_uuid"];
    title = map["title"];
  }
}
