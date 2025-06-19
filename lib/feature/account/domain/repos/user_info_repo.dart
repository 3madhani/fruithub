import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/order_entity.dart';
import '../entities/user_info_entity.dart';

abstract class UserInfoRepo {
  Stream<Either<Failure, UserInfoEntity>> getUserInfo();

  Future<void> updateUserInfo({
    required String name,
    required String imageUrl,
    required String email,
  });

  Future<Either<Failure, List<OrderEntity>>> getOrdersOfUser(UserInfoEntity user);
}
