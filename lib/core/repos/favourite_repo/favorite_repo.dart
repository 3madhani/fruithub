import 'package:dartz/dartz.dart';
import 'package:fruithub/core/entities/product_entity.dart';

import '../../errors/failure.dart';

abstract class FavouritesRepo {
  Future<Either<Failure, void>> addFavorite({required String code});

  Stream<Either<Failure, List<ProductEntity>>> fetchFavorites({
    required List<String> codes,
  });
}
