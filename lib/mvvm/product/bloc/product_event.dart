part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class GetProductImages extends ProductEvent {
  final Product product;
  const GetProductImages({required this.product});

  @override
  List<Object> get props => [product];
}
