import 'package:eticaret/mvvm/product/model/product_model.dart';
import 'package:eticaret/service/picture_service.dart';
import 'package:eticaret/service/product_service.dart';

class ProductRepository {
  // Singleton
  ProductRepository._singleton();
  static final ProductRepository _instance = ProductRepository._singleton();
  static ProductRepository get instance => _instance;

  // Property
  List<Product> products = [];

  // Methods
  Future<List<Product>> getProducts() async {
    if (products.isEmpty) {
      List<Product>? newProducts = await ProductService.instance.getProducts();
      if (newProducts != null) {
        // Get Pictures of Images
        for (Product product in newProducts) {
          if (product.smallPictureUuid != null) {
            product.picture = await PictureService.instance
                .getPictureById(product.smallPictureUuid!);
          }
        }
        products.addAll(newProducts);
      }
    }
    return products;
  }
}
