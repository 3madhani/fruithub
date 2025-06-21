import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/repos/favourite_repo/favorite_repo.dart';

import '../../../../../core/entities/product_entity.dart';

part 'fetch_favourites_state.dart';

class FetchFavouritesCubit extends Cubit<FetchFavouritesState> {
  final FavouritesRepo favoriteRepo;
  StreamSubscription? _subscription;

  List<String> _lastCodes = [];

  FetchFavouritesCubit(this.favoriteRepo) : super(FetchFavouritesInitial());

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  void fetchFavourites(List<String> codes) {
    _lastCodes = List.from(codes);

    if (_setEquals(_lastCodes, codes)) {
      _subscription = favoriteRepo.fetchFavorites(codes: codes).listen((
        result,
      ) {
        result.fold(
          (failure) => emit(FetchFavouritesFailure(failure.message)),
          (products) => emit(FetchFavouritesSuccess(products)),
        );
      });
    } else {
      _subscription?.cancel();
      _subscription = favoriteRepo.fetchFavorites(codes: codes).listen((
        result,
      ) {
        result.fold(
          (failure) => emit(FetchFavouritesFailure(failure.message)),
          (products) => emit(FetchFavouritesSuccess(products)),
        );
      });
    }
  }

  bool _setEquals(List<String> a, List<String> b) {
    return Set<String>.from(a).containsAll(b);
  }
}
