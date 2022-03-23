import 'package:eticaret/mvvm/product/model/product_model.dart';
import 'package:eticaret/util/base/base_model.dart';
import 'dart:convert';

class ProductsResponse extends BaseModel {
  List<Product>? products;

  @override
  fromJson(String jsonStr) {
    products = List<Product>.from(
        json.decode(jsonStr).map((x) => Product()..fromMap(x)));
    // for (Map<String, dynamic> i in json.decode(jsonStr)) {
    //   Product product = Product()..fromMap(i);
    // }
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
