import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eticaret/mvvm/product/model/product_response_model.dart';
import 'package:eticaret/repository/product_repository.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(LoadingState()) {
    on<GetFavoritesEvent>((event, emit) async {
      emit(LoadingState());
      emit(
        LoadedState(
          products: await ProductRepository.instance.getFavorites(),
        ),
      );
    });
    on<DeleteFavoriteEvent>((event, emit) async {
      emit(LoadingState());
      await ProductRepository.instance.deleteFavorite(event.product);
      emit(
        LoadedState(
          products: await ProductRepository.instance.getFavorites(),
        ),
      );
    });
  }
}
