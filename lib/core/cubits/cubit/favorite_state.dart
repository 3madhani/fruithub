part of 'favorite_cubit.dart';

class FavoriteFailure extends FavoriteState {
  final String message;

  FavoriteFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

abstract class FavoriteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavoriteStatusLoaded extends FavoriteState {
  final bool isFavorite;

  FavoriteStatusLoaded(this.isFavorite);

  @override
  List<Object?> get props => [isFavorite];
}

class FavoriteSuccess extends FavoriteState {}
