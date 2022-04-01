import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eticaret/mvvm/product/model/product_model.dart';
import 'package:eticaret/repository/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  late Product resultProduct;
  ProductBloc(Product initProduct)
      : super(ProductLoadedState(product: initProduct)) {
    on<GetProductImagesEvent>((event, emit) async {
      resultProduct =
          await ProductRepository.instance.getProductImages(event.product);
      emit(ProductLoadedState(product: resultProduct, isPicturesLoaded: true));
    });
    on<OnImageSelectEvent>((event, emit) async {
      emit(ProductLoadedState(
        product: resultProduct,
        isPicturesLoaded: true,
        bigPhotoSelectedIndex: event.index,
      ));
    });
  }
}
