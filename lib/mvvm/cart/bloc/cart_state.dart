part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class LoadedState extends CartState {
  final List<ProductResponse> products;
  const LoadedState({required this.products});

  @override
  List<Object> get props => [products];
}

class LoadingState extends CartState {
  @override
  List<Object> get props => [];
}
