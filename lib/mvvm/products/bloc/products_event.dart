part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class GetProductsEvent extends ProductsEvent {}

class GetProductsByCategoryEvent extends ProductsEvent {
  Category category;
  GetProductsByCategoryEvent({required this.category});
}
