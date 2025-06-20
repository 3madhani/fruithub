import '../../feature/account/domain/entities/order_entity.dart';

getDummyOrder() {
  return OrderEntity(
    status: 'Delivered',
    orderId: '1234567890',
    totalPrice: 100.0,
    orderProducts: [],
    date: DateTime.now(),
  );
}

getDummyOrders() {
  return List.generate(10, (index) => getDummyOrder());
}
