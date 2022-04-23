import 'package:eticaret/mvvm/category/model/categories_reponse_model.dart';
import 'package:eticaret/mvvm/category/model/category_model.dart';
import 'package:eticaret/util/base/base_service.dart';
import 'package:eticaret/util/constant/service_method.dart';

class CategoryService extends BaseService {
  // Singleton
  CategoryService._singleton();
  static final CategoryService _instance = CategoryService._singleton();
  static CategoryService get instance => _instance;

  // Methods
  Future<List<Category>?> getCategories() async {
    CategoriesResponse? categoriesResponse =
        await request<Category, CategoriesResponse>(
      responseModel: CategoriesResponse(),
      serviceMethod: ServiceMethod.GET_CATEGORIES,
    );
    return categoriesResponse!.categories;
  }
}
