part of 'fetch_favourites_cubit.dart';

final class FetchFavouritesFailure extends FetchFavouritesState {
  final String message;
  const FetchFavouritesFailure(this.message);
  @override
  List<Object> get props => [message];
}

final class FetchFavouritesInitial extends FetchFavouritesState {}

final class FetchFavouritesLoading extends FetchFavouritesState {}

sealed class FetchFavouritesState extends Equatable {
  const FetchFavouritesState();

  @override
  List<Object> get props => [];
}

final class FetchFavouritesSuccess extends FetchFavouritesState {
  final List<ProductEntity> products;
  const FetchFavouritesSuccess(this.products);
  @override
  List<Object> get props => [products];
}
