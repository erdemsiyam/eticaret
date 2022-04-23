import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eticaret/mvvm/product/model/product_response_model.dart';
import 'package:flutter/rendering.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(ProductResponse initProduct) : super(const ProductLoadedState()) {
    on<OnFavoriteChangeEvent>((event, emit) async {
      // TODO : fav gönder
      emit(const ProductLoadedState());
    });
  }
}
