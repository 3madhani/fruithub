import 'package:dartz/dartz.dart';

import '../../entities/product_entity.dart';
import '../../errors/failure.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getBestSellProducts();
}
