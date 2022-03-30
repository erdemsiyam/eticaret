import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eticaret/mvvm/category/model/category_model.dart';
import 'package:eticaret/repository/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(LoadingState()) {
    on<GetCategoriesEvent>((event, emit) async {
      // emit(LoadingState())
      emit(
        LoadedState(
          categories: await CategoryRepository.instance.getCategories(),
        ),
      );
    });

    on<SelectCategoryEvent>((event, emit) async {
      emit(LoadingState());
      List<Category> categories =
          await CategoryRepository.instance.getCategories();
      for (Category c in categories) {
        if (c.uuid == event.selectedCategoryUuid) {
          c.isSelected = true;
        } else {
          c.isSelected = false;
        }
      }
      emit(
        LoadedState(categories: categories),
      );
    });
  }
}
