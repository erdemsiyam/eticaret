part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class GetCategoriesEvent extends CategoryEvent {
  @override
  List<Object> get props => [];
}

class SelectCategoryEvent extends CategoryEvent {
  final String selectedCategoryUuid;
  const SelectCategoryEvent({required this.selectedCategoryUuid});
  @override
  List<Object> get props => [selectedCategoryUuid];
}
