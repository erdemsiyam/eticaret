part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductLoadedState extends ProductState {
  final int bigPhotoSelectedIndex;
  // final int selectedSizeOptionIndex;
  // final int selectedColorOptionIndex;
  const ProductLoadedState({
    this.bigPhotoSelectedIndex = 0,
    // this.selectedSizeOptionIndex = 0,
    // this.selectedColorOptionIndex = 0,
  });

  @override
  List<Object> get props => [
        bigPhotoSelectedIndex,
        // selectedSizeOptionIndex,
        // selectedColorOptionIndex,
      ];
}
