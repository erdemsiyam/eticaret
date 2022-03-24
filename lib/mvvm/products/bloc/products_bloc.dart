import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eticaret/mvvm/category/model/category_model.dart';
import 'package:eticaret/mvvm/product/model/product_model.dart';
import 'package:eticaret/repository/product_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(LoadingState()) {
    on<GetProductsEvent>((event, emit) async {
      // emit(LoadingState())
      emit(
        LoadedState(
          products: await ProductRepository.instance.getProducts(),
        ),
      );
    });
    on<GetProductsByCategoryEvent>((event, emit) async {
      emit(LoadingState());
      emit(
        LoadedState(
          products: await ProductRepository.instance
              .getProductsByCategory(event.category),
        ),
      );
    });
  }
}
