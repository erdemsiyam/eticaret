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

// class OnOptionSelectEvent extends ProductEvent {
//   final int selectedSizeOptionIndex;
//   final int selectedColorOptionIndex;
//   const OnOptionSelectEvent({
//     required this.selectedSizeOptionIndex,
//     required this.selectedColorOptionIndex,
//   });

//   @override
//   List<Object> get props => [
//         selectedSizeOptionIndex,
//         selectedColorOptionIndex,
//       ];
// }
