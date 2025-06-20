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
  Future<Either<Failure, void>> addFavorite({
    required ProductEntity productEntity,
  }) async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null)
        return const Left(ServerFailure("User not authenticated"));

      final userDoc = FirebaseFirestore.instance
          .collection(BackendEndpoints.getUserData)
          .doc(userId);

      final snapshot = await userDoc.get();
      final data = snapshot.data();
      final List<dynamic> favList = data?['favourites'] ?? [];

      final code = productEntity.code;
      final List<Map<String, dynamic>> favorites =
          favList
              .whereType<Map<String, dynamic>>()
              .map((e) => Map<String, dynamic>.from(e))
              .toList();

      final int existingIndex = favorites.indexWhere(
        (e) => e.containsKey(code),
      );

      if (existingIndex != -1) {
        // Remove from favorites
        favorites.removeAt(existingIndex);
      } else {
        // Add to favorites
        favorites.add({code: ProductModel.fromEntity(productEntity).toJson()});
      }

      await userDoc.update({'favourites': favorites});

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  }
