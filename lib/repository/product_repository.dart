import 'package:eticaret/mvvm/category/model/category_model.dart';
import 'package:eticaret/mvvm/product/model/product_response_model.dart';
import 'package:eticaret/service/product_service.dart';

class ProductRepository {
  // Singleton
  ProductRepository._singleton();
  static final ProductRepository _instance = ProductRepository._singleton();
  static ProductRepository get instance => _instance;

  // Property
  List<ProductResponse> products = [];
  List<ProductResponse> selectedProducts =
      []; // By Word Search or By Category select

  // Methods
  Future<List<ProductResponse>> getProducts() async {
    if (products.isEmpty) {
      List<ProductResponse>? newProducts =
          await ProductService.instance.getProducts();
      if (newProducts != null) {
        products.addAll(newProducts);
        selectedProducts.addAll(newProducts);
      }
    }
    return selectedProducts;
  }

  Future<List<ProductResponse>> getProductsByCategory(Category category) async {
    if (selectedProducts.isEmpty) {
      await getProducts();
    }

    if (category.uuid == "0") {
      // 0 : mean is all.
      selectedProducts = products;
    } else {
      selectedProducts = products
          .where((element) => element.categoryUuid == category.uuid)
          .toList();
    }
    return selectedProducts;
  }

  addFavorite(ProductResponse product) async {
    await ProductService.instance.addFavorite(product);
  }

  deleteFavorite(ProductResponse product) async {
    await ProductService.instance.deleteFavorite(product);
  }
}
