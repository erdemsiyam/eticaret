part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();
}

class GetFavoritesEvent extends FavoritesEvent {
  @override
  List<Object> get props => [];
}

class DeleteFavoriteEvent extends FavoritesEvent {
  final ProductResponse product;
  const DeleteFavoriteEvent({required this.product});

  @override
  List<Object> get props => [product.uuid!];
}
