import 'package:eticaret/mvvm/product/model/product_response_model.dart';
import 'package:eticaret/mvvm/product/model/products_response_model.dart';
import 'package:eticaret/util/base/base_service.dart';
import 'package:eticaret/util/constant/service_method.dart';

class ProductService extends BaseService {
  // Singleton
  ProductService._singleton();
  static final ProductService _instance = ProductService._singleton();
  static ProductService get instance => _instance;

  // Methods
  Future<List<ProductResponse>?> getProducts() async {
    ProductsResponse? productsResponse =
        await request<ProductsResponse, ProductsResponse>(
      responseModel: ProductsResponse(),
      serviceMethod: ServiceMethod.GET_PRODUCTS,
    );
    return productsResponse!.products;
  }

  addFavorite(ProductResponse product) async {
    await request<ProductsResponse, ProductsResponse>(
      serviceMethod: ServiceMethod.ADD_FAVORITE,
      query: product.uuid,
    );
  }

  deleteFavorite(ProductResponse product) async {
    await request<ProductsResponse, ProductsResponse>(
      serviceMethod: ServiceMethod.DELETE_FAVORITE,
      query: product.uuid,
    );
  }

  Future<List<ProductResponse>?> getFavorites() async {
    ProductsResponse? productsResponse =
        await request<ProductsResponse, ProductsResponse>(
      responseModel: ProductsResponse(),
      serviceMethod: ServiceMethod.GET_FAVORITES,
    );
    return productsResponse!.products;
  }

  Future<List<ProductResponse>?> getCart() async {
    ProductsResponse? productsResponse =
        await request<ProductsResponse, ProductsResponse>(
      responseModel: ProductsResponse(),
      serviceMethod: ServiceMethod.GET_CART,
    );
    return productsResponse!.products;
  }

  addCartItem(ProductResponse product) async {
    await request<ProductResponse, ProductResponse>(
      requestModel: product,
      serviceMethod: ServiceMethod.ADD_CART_ITEM,
    );
  }

  deleteCartItem(ProductResponse product) async {
    await request<ProductResponse, ProductResponse>(
      serviceMethod: ServiceMethod.DELETE_FAVORITE,
      query: product.cartItemUuid,
    );
  }
}
