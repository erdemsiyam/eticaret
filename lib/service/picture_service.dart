import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:eticaret/mvvm/product/model/product_response_model.dart';
import 'package:eticaret/mvvm/product/model/products_response_model.dart';
import 'package:eticaret/util/base/base_service.dart';
import 'package:eticaret/util/constant/service_method.dart';
import 'package:eticaret/util/model/user_model.dart';

class PictureService extends BaseService {
  // Singleton
  PictureService._singleton();
  static final PictureService _instance = PictureService._singleton();
  static PictureService get instance => _instance;

  // Methods
  Future<Uint8List> getPictureById(String uuid) async {
    return (await http.get(Uri.parse('http://127.0.0.1:8000/picture/$uuid')))
        .bodyBytes;
  }
}
