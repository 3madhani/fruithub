import 'package:dartz/dartz.dart';

import '../../../feature/checkout/data/model/order_model.dart';
import '../../../feature/checkout/domain/entities/order_entity.dart';
import '../../errors/failure.dart';
import '../../services/database_services.dart';
import '../../utils/backend_endpoints.dart';
import 'orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseServices databaseServices;

  OrdersRepoImpl({required this.databaseServices});
  @override
  Future<Either<Failure, void>> addOrder({
    required OrderEntity orderEntity,
  }) async {
    try {
      await databaseServices.setData(
        path: BackendEndpoints.addOrders,
        data: OrderModel.fromEntity(orderEntity).toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
