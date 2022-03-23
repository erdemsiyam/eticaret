part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class LoadedState extends ProductsState {
  final List<Product> products;
  const LoadedState({required this.products});
}

class LoadingState extends ProductsState {}
