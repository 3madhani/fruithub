import 'package:dartz/dartz.dart';
import 'package:fruithub/core/entities/product_entity.dart';
import 'package:fruithub/core/errors/failure.dart';
import 'package:fruithub/core/models/product_model.dart';

import '../../services/database_services.dart';
import '../../utils/backend_endpoints.dart';
import 'product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseServices databaseServices;
  ProductRepoImpl({required this.databaseServices});
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellProducts() async {
    try {
      var data =
          await databaseServices.getData(
                path: BackendEndpoints.getProducts,
                queryParameters: {
                  "orderBy": "sellingCount",
                  "limit": 10,
                  "descending": true,
                },
              )
              as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();

      return Right(products);
    } catch (e) {
      return Left(
        ServerFailure("Failed to fetch best selling products: ${e.toString()}"),
      );
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await databaseServices.getData(path: BackendEndpoints.getProducts)
              as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();

      return Right(products);
    } catch (e) {
      return const Left(ServerFailure("Failed to fetch products"));
    }
  }
}
