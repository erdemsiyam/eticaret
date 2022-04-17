import 'package:eticaret/mvvm/product/model/product_response_model.dart';
import 'package:eticaret/util/base/base_model.dart';
import 'dart:convert';

class ProductsResponse extends BaseModel {
  List<ProductResponse>? products;

  @override
  fromJson(String jsonStr) {
    products = List<ProductResponse>.from(
        json.decode(jsonStr).map((x) => ProductResponse()..fromMap(x)));
  }

  @override
  String toJson() {
    return (products != null)
        ? json.encode(List<String>.from(products!.map((x) => x..toJson())))
        : json.encode('[]');
  }

  @override
  fromMap(Map<String, dynamic> map) {
    throw UnimplementedError();
  }
}
