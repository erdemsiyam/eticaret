part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductLoadedState extends ProductState {
  final Product product;
  final bool isPicturesLoaded;
  const ProductLoadedState(
      {required this.product, this.isPicturesLoaded = false});

  @override
  List<Object> get props => [product, isPicturesLoaded];
}
