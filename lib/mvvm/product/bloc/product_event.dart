part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class OnFavoriteChangeEvent extends ProductEvent {
  final ProductResponse product;
  final bool isAdded;
  const OnFavoriteChangeEvent({required this.product, required this.isAdded});

  @override
  List<Object> get props => [
        product.uuid ?? "",
        isAdded,
      ];
}
