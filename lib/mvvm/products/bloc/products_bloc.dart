import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eticaret/mvvm/category/model/category_model.dart';
import 'package:eticaret/mvvm/product/model/product_response_model.dart';
import 'package:eticaret/repository/product_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(LoadingState()) {
    on<GetProductsEvent>((event, emit) async {
      emit(LoadingState());
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
    on<ScrollProductsEvent>((event, emit) async {
      List<ProductResponse> products =
          await ProductRepository.instance.getProducts();
      for (ProductResponse p in products) {
        p.isSelected = false;
      }
      products[event.selectedIndex].isSelected = true;
      emit(
        LoadedState(
          products: products,
          selectedIndex: event.selectedIndex,
        ),
      );
    });
  }
}
