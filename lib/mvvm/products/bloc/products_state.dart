part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
}

class LoadedState extends ProductsState {
  final List<ProductResponse> products;
  final int selectedIndex;
  const LoadedState({required this.products, this.selectedIndex = 0});

  @override
  List<Object> get props => [products, selectedIndex];
}

class LoadingState extends ProductsState {
  @override
  List<Object> get props => [];
}
