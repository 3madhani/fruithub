import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repos/favourite_repo/favorite_repo.dart';

part 'add_favorite_state.dart';

class AddFavoriteCubit extends Cubit<AddFavoriteState> {
  final FavouritesRepo favoriteRepo;

  AddFavoriteCubit(this.favoriteRepo) : super(AddFavoriteInitial());

  Future<void> addFavorite({required String code}) async {
    final result = await favoriteRepo.addFavorite(code: code);
    result.fold(
      (failure) => emit(AddFavoriteFailure(failure.message)),
      (_) => emit(AddFavoriteSuccess()),
    );
  }
}
