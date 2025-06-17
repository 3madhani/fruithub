import 'package:dartz/dartz.dart';

import '../../../feature/checkout/domain/entities/order_input_entity.dart';
import '../../errors/failure.dart';

abstract class OrdersRepo {
  Future<Either<Failure, void>> addOrder({
    required OrderInputEntity orderEntity,
  });
}
