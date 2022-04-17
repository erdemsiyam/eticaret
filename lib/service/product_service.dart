import 'package:eticaret/mvvm/product/model/product_response_model.dart';
import 'package:eticaret/mvvm/product/model/products_response_model.dart';
import 'package:eticaret/util/base/base_service.dart';
import 'package:eticaret/util/constant/service_method.dart';
import 'package:eticaret/util/model/user_model.dart';

class ProductService extends BaseService {
  // Singleton
  ProductService._singleton();
  static final ProductService _instance = ProductService._singleton();
  static ProductService get instance => _instance;

  // Methods
  Future<List<Product>?> getProducts() async {
    ProductsResponse productsResponse =
        await request<Product, ProductsResponse>(
      responseModel: ProductsResponse(),
      serviceMethod: ServiceMethod.GET_PRODUCTS,
    );
    return productsResponse.products;
  }
}
