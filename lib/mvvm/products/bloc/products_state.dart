part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
}

class LoadedState extends ProductsState {
  final List<Product> products;
  const LoadedState({required this.products});

  @override
  List<Object> get props => [products];
}

class LoadingState extends ProductsState {
  @override
  List<Object> get props => [];
}
