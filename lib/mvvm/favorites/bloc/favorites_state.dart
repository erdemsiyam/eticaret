part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();
}

class LoadedState extends FavoritesState {
  final List<ProductResponse> products;
  const LoadedState({required this.products});

  @override
  List<Object> get props => [products.length];
}

class LoadingState extends FavoritesState {
  @override
  List<Object> get props => [];
}
