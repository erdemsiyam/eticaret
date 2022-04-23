import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eticaret/mvvm/product/model/product_response_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  // late ProductResponse resultProduct;
  int? lastPhotoIndex;
  List<int>? lastSelectedOptions;
  // int? lastSelectedSizeOptionIndex;
  // int? lastSelectedColorOptionIndex;
  ProductBloc(ProductResponse initProduct) : super(const ProductLoadedState()) {
    on<OnImageSelectEvent>((event, emit) async {
      lastPhotoIndex = event.index;
      emit(ProductLoadedState(
        bigPhotoSelectedIndex: event.index,
        // selectedSizeOptionIndex: lastSelectedSizeOptionIndex ?? 0,
        // selectedColorOptionIndex: lastSelectedColorOptionIndex ?? 0,
      ));
    });

    // on<OnOptionSelectEvent>((event, emit) async {
    //   lastSelectedSizeOptionIndex = event.selectedSizeOptionIndex;
    //   lastSelectedColorOptionIndex = event.selectedColorOptionIndex;
    //   emit(ProductLoadedState(
    //     bigPhotoSelectedIndex: lastPhotoIndex ?? 0,
    //     selectedSizeOptionIndex: lastSelectedSizeOptionIndex!,
    //     selectedColorOptionIndex: lastSelectedColorOptionIndex!,
    //   ));
    // });
  }
}
