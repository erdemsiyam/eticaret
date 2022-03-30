part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class GetProductsEvent extends ProductsEvent {}

class GetProductsByCategoryEvent extends ProductsEvent {
  final Category category;
  const GetProductsByCategoryEvent({required this.category});
}

class ScrollProductsEvent extends ProductsEvent {
  final int selectedIndex;
  const ScrollProductsEvent({required this.selectedIndex});
  @override
  List<Object> get props => [selectedIndex];
}
