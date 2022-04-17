part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

// class GetProductImagesEvent extends ProductEvent {
//   final ProductResponse product;
//   const GetProductImagesEvent({required this.product});

//   @override
//   List<Object> get props => [product];
// }

class OnImageSelectEvent extends ProductEvent {
  final int index;
  const OnImageSelectEvent({required this.index});

  @override
  List<Object> get props => [index];
}
