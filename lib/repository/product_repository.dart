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
  List<ProductResponse> favorites = [];
  List<ProductResponse> cart = [];

  // Methods
  Future<List<ProductResponse>> getProducts() async {
    if (products.isEmpty) {
      List<ProductResponse>? newProducts =
          await ProductService.instance.getProducts();
      if (newProducts != null) {
        products.addAll(newProducts);
        selectedProducts.addAll(newProducts);
      }
      await getFavorites();
      await getCart();
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
    favorites.add(product);
    products.where((element) => element.uuid == product.uuid).first.isLiked =
        true;
    selectedProducts
        .where((element) => element.uuid == product.uuid)
        .first
        .isLiked = true;
  }

  deleteFavorite(ProductResponse product) async {
    await ProductService.instance.deleteFavorite(product);
    favorites.removeWhere((element) => element.uuid == product.uuid);
    products.where((element) => element.uuid == product.uuid).first.isLiked =
        false;
    selectedProducts
        .where((element) => element.uuid == product.uuid)
        .first
        .isLiked = false;
  }

  Future<List<ProductResponse>> getFavorites() async {
    if (favorites.isEmpty) {
      List<ProductResponse>? newFavorites =
          await ProductService.instance.getProducts();
      if (newFavorites != null) {
        favorites = newFavorites;
      }
    }

    // Hepsi false yapılır
    products.map((e) {
      e.isLiked = false;
    });
    selectedProducts.map((e) {
      e.isLiked = false;
    });

    // Favoriler true yapılır
    for (ProductResponse favori in favorites) {
      products.where((element) => element.uuid == favori.uuid).first.isLiked =
          true;
      selectedProducts
          .where((element) => element.uuid == favori.uuid)
          .first
          .isLiked = true;
    }

    return favorites;
  }

  Future<List<ProductResponse>> getCart() async {
    // TODO yapılmalı
    cart = [];
    return [];
  }
}
