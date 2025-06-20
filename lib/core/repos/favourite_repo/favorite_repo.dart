import 'package:dartz/dartz.dart';
import 'package:fruithub/core/entities/product_entity.dart';
import 'package:fruithub/core/errors/failure.dart';

abstract class FavouritesRepo {
  Future<Either<Failure, void>> addFavorite({
    required ProductEntity productEntity,
  });
}
