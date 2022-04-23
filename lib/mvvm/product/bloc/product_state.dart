part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductLoadedState extends ProductState {
  const ProductLoadedState();

  @override
  List<Object> get props => [];
}
