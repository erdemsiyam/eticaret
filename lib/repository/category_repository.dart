import 'package:eticaret/mvvm/category/model/category_model.dart';
import 'package:eticaret/service/category_service.dart';
import 'package:eticaret/service/picture_service.dart';

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
        // Category resimleri çekilir
        // for (Category category in newCategories) {
        //   if (category.pictureUuid != null) {
        //     category.picture = await PictureService.instance
        //         .getPictureById(category.pictureUuid!);
        //   }
        // }
        categories.add(Category(uuid: "0", title: "All", isSelected: true));
        categories.addAll(newCategories);
      }
    }
    return categories;
  }
}
