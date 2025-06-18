import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruithub/feature/account/domain/entities/user_info_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/database_services.dart';
import '../../../../core/utils/backend_endpoints.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repos/user_info_repo.dart';
import '../model/order_model.dart';
import '../model/user_info_model.dart';

class UserInfoRepoImpl implements UserInfoRepo {
  final DatabaseServices databaseServices;

  UserInfoRepoImpl({required this.databaseServices});
  @override
  Stream<Either<Failure, UserInfoEntity>> getUserInfo() async* {
    try {
      var data = await databaseServices.getData(
        path: BackendEndpoints.getUserData,
        documentId: FirebaseAuth.instance.currentUser!.uid,
      );

      yield Right(UserInfoModel.fromJson(data).toEntity());
    } catch (e) {
      yield Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<OrderEntity>>> getOrdersOfUser(
    UserInfoEntity user,
  ) async {
    try {
      final orderFutures = user.orders.map((orderId) {
        return databaseServices
            .getData(
              path: BackendEndpoints.getOrders,
              documentId: orderId,
            )
            .then((data) => OrderModel.fromJson(data).toEntity());
      });

      final orders = await Future.wait(orderFutures);
      return Right(orders);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
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
