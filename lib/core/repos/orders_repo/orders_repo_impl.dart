import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../feature/checkout/data/model/order_input_model.dart';
import '../../../feature/checkout/domain/entities/order_input_entity.dart';
import '../../errors/failure.dart';
import '../../services/database_services.dart';
import '../../utils/backend_endpoints.dart';
import 'orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseServices databaseServices;

  OrdersRepoImpl({required this.databaseServices});
  @override
  Future<Either<Failure, void>> addOrder({
    required OrderInputEntity orderEntity,
  }) async {
    try {
      var order = OrderInputModel.fromEntity(orderEntity);
      await databaseServices.setData(
        path: BackendEndpoints.addOrders,
        documentId: order.orderId,
        data: order.toJson(),
      );
      await databaseServices.updateData(
        path: BackendEndpoints.addUserData,
        documentId: FirebaseAuth.instance.currentUser!.uid,
        data: {
          'orders': FieldValue.arrayUnion([order.orderId]),
        },
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
