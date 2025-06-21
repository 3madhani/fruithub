import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruithub/core/entities/product_entity.dart';
import 'package:fruithub/core/errors/failure.dart';
import 'package:fruithub/core/services/database_services.dart';

import '../../models/product_model.dart';
import '../../utils/backend_endpoints.dart';
import 'favorite_repo.dart';

class FavouritesRepoImpl implements FavouritesRepo {
  final DatabaseServices databaseServices;

  FavouritesRepoImpl({required this.databaseServices});

  @override
  Future<Either<Failure, void>> addFavorite({required String code}) async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        return const Left(ServerFailure("User not authenticated"));
      }

      final userDoc = FirebaseFirestore.instance
          .collection(BackendEndpoints.getUserData)
          .doc(userId);

      final snapshot = await userDoc.get();

      if (!snapshot.exists) {
        return const Left(ServerFailure("User document not found"));
      }

      final data = snapshot.data();
      final List<dynamic> favListRaw = data?['favourites'] ?? [];

      // Ensure the list is treated as List<String>
      final List<String> favList = List<String>.from(favListRaw);

      if (favList.contains(code)) {
        favList.remove(code);
      } else {
        favList.add(code);
      }

      await userDoc.update({'favourites': favList});
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("Failed to update favorites: ${e.toString()}"));
    }
  }

  @override
  Stream<Either<Failure, List<ProductEntity>>> fetchFavorites({
    required List<String> codes,
  }) async* {
    try {
      final stream = databaseServices.streamData(
        path: BackendEndpoints.getProducts,
      );

      yield* stream.map((dataList) {
        try {
          final productEntities =
              (dataList as List)
                  .map(
                    (item) =>
                        ProductModel.fromJson(item as Map<String, dynamic>),
                  )
                  .where(
                    (product) => codes.contains(product.code),
                  ) // 🔥 filter by codes
                  .map((product) => product.toEntity())
                  .toList();

          return Right(productEntities);
        } catch (e) {
          return Left(ServerFailure("Mapping error: ${e.toString()}"));
        }
      });
    } catch (e) {
      yield Left(ServerFailure("Failed to fetch favorites: ${e.toString()}"));
    }
  }
}
