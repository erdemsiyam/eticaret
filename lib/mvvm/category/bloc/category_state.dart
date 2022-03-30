part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class LoadedState extends CategoryState {
  final List<Category> categories;
  final String selectedCategoryUuid;
  const LoadedState({required this.categories, this.selectedCategoryUuid = ""});

  @override
  List<Object> get props => [categories];
}

class LoadingState extends CategoryState {
  @override
  List<Object> get props => [];
}
