import 'dart:convert';

import 'package:eticaret/mvvm/category/model/category_model.dart';
import 'package:eticaret/util/base/base_model.dart';

class CategoriesResponse extends BaseModel {
  List<Category>? categories;

  @override
  fromJson(String jsonStr) {
    categories = List<Category>.from(
        json.decode(jsonStr).map((x) => Category()..fromMap(x)));
  }

  @override
  String toJson() {
    return (categories != null)
        ? json.encode(List<String>.from(categories!.map((x) => x..toJson())))
        : json.encode('[]');
  }

  @override
  fromMap(Map<String, dynamic> map) {
    throw UnimplementedError();
  }
}
