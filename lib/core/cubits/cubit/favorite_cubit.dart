import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../entities/product_entity.dart';
import '../../repos/favourite_repo/favorite_repo.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavouritesRepo favoriteRepo;

  FavoriteCubit(this.favoriteRepo) : super(FavoriteInitial());

  Future<void> addFavorite({required ProductEntity productEntity}) async {
    final result = await favoriteRepo.addFavorite(productEntity: productEntity);
    result.fold(
      (failure) => emit(FavoriteFailure(failure.message)),
      (_) => emit(FavoriteSuccess()),
    );
  }
}
