part of 'add_favorite_cubit.dart';

class AddFavoriteFailure extends AddFavoriteState {
  final String message;

  AddFavoriteFailure(this.message);
}

class AddFavoriteInitial extends AddFavoriteState {}

class AddFavoriteLoading extends AddFavoriteState {}

abstract class AddFavoriteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddFavoriteSuccess extends AddFavoriteState {}
