part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class GetCartEvent extends CartEvent {
  @override
  List<Object> get props => [];
}

class DeleteCartItemEvent extends CartEvent {
  final ProductResponse product;
  const DeleteCartItemEvent({required this.product});

  @override
  List<Object> get props => [product.uuid!];
}
