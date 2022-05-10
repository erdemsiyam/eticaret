import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eticaret/mvvm/product/model/product_response_model.dart';
import 'package:eticaret/repository/product_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(LoadingState()) {
    on<GetCartEvent>((event, emit) async {
      emit(LoadingState());
      emit(
        LoadedState(
          products: await ProductRepository.instance.getCartItems(),
        ),
      );
    });
    on<DeleteCartItemEvent>((event, emit) async {
      emit(LoadingState());
      await ProductRepository.instance.deleteCartItem(event.product);
      emit(
        LoadedState(
          products: await ProductRepository.instance.getCartItems(),
        ),
      );
    });
  }
}
