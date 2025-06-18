
import 'order_product_entity.dart';

class OrderEntity {
  final double totalPrice;
  final List<OrderProductEntity> orderProducts;
  final String status;
  final DateTime date;
  final String orderId;

  OrderEntity({
    required this.orderId,
    required this.totalPrice,
    required this.orderProducts,
    required this.status,
    required this.date,
  });

  String getFormattedDate() {
    return '${date.day}/${date.month}/${date.year} - ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }

}
