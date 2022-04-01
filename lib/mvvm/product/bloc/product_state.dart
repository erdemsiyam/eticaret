part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductLoadedState extends ProductState {
  final Product product;
  final bool isPicturesLoaded;
  final int bigPhotoSelectedIndex;
  const ProductLoadedState({
    required this.product,
    this.isPicturesLoaded = false,
    this.bigPhotoSelectedIndex = 0,
  });

  @override
  List<Object> get props => [
        product,
        isPicturesLoaded,
        bigPhotoSelectedIndex,
      ];
}
