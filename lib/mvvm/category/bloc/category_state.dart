part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class LoadedState extends CategoryState {
  final List<Category> categories;
  const LoadedState({required this.categories});
}

class LoadingState extends CategoryState {}
