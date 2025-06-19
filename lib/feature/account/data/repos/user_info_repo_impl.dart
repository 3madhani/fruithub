import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/database_services.dart';
import '../../../../core/utils/backend_endpoints.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/entities/user_info_entity.dart';
import '../../domain/repos/user_info_repo.dart';
import '../model/order_model.dart';
import '../model/user_info_model.dart';

class UserInfoRepoImpl implements UserInfoRepo {
  final DatabaseServices databaseServices;

  UserInfoRepoImpl({required this.databaseServices});
  @override
  Stream<Either<Failure, List<OrderEntity>>> getOrdersOfUser(
    UserInfoEntity user,
  ) {
    if (user.orders.isEmpty) {
      return Stream.value(const Right([]));
    }

    try {
      // Create a list of order document streams
      final orderStreams =
          user.orders.map((orderId) {
            return databaseServices
                .streamData(
                  path: BackendEndpoints.getOrders,
                  documentId: orderId,
                )
                .map((docSnapshot) {
                  final data = docSnapshot.data();
                  if (data != null && data is Map<String, dynamic>) {
                    return OrderModel.fromJson(data).toEntity();
                  } else {
                    throw Exception("Invalid data for order $orderId");
                  }
                });
          }).toList();

      // Combine them into one stream of List<OrderEntity>
      return Rx.combineLatestList(
        orderStreams,
      ).map((orders) => Right<Failure, List<OrderEntity>>(orders));
    } catch (e) {
      return Stream.value(Left(ServerFailure(e.toString())));
    }
  }

  @override
  Stream<Either<Failure, UserInfoEntity>> getUserInfo() async* {
    try {
      yield* databaseServices
          .streamData(
            path: BackendEndpoints.getUserData,
            documentId: FirebaseAuth.instance.currentUser!.uid,
          )
          .map((doc) {
            final data = doc.data();
            if (data != null && data is Map<String, dynamic>) {
              return Right(UserInfoModel.fromJson(data).toEntity());
            } else {
              return const Left(ServerFailure("Invalid or missing user data"));
            }
          });
    } catch (e) {
      yield Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> updateUserInfo({
    required String name,
    required String imageUrl,
    required String email,
  }) {
    // TODO: implement updateUserInfo
    throw UnimplementedError();
  }
}
