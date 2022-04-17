import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eticaret/mvvm/product/model/product_response_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  late ProductResponse resultProduct;
  ProductBloc(ProductResponse initProduct)
      : super(ProductLoadedState(product: initProduct)) {
    // on<GetProductImagesEvent>((event, emit) async {
    //   resultProduct =
    //       await ProductRepository.instance.getProductImages(event.product);
    //   emit(ProductLoadedState(product: resultProduct, isPicturesLoaded: true));
    // });
    on<OnImageSelectEvent>((event, emit) async {
      emit(ProductLoadedState(
        product: resultProduct,
        // isPicturesLoaded: true,
        bigPhotoSelectedIndex: event.index,
      ));
    });
  }
}
