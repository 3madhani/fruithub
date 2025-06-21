import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/order_entity.dart';
import '../entities/user_info_entity.dart';

abstract class UserInfoRepo {
  Stream<Either<Failure, UserInfoEntity>> getUserInfo();

  Future<Either< Failure, void>> updateUserInfo({
    required Map<String, dynamic> query,
  });

  Stream<Either<Failure, List<OrderEntity>>> getOrdersOfUser(UserInfoEntity user);
}
