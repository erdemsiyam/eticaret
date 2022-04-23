import 'package:eticaret/mvvm/category/model/category_model.dart';
import 'package:eticaret/service/category_service.dart';

class CategoryRepository {
  // Singleton
  CategoryRepository._singleton();
  static final CategoryRepository _instance = CategoryRepository._singleton();
  static CategoryRepository get instance => _instance;

  // Property
  List<Category> categories = [];

  // Methods
  Future<List<Category>> getCategories() async {
    if (categories.isEmpty) {
      List<Category>? newCategories =
          await CategoryService.instance.getCategories();
      if (newCategories != null) {
        categories.add(Category(uuid: "0", title: "All", isSelected: true));
        categories.addAll(newCategories);
      }
    }
    return categories;
  }
}
