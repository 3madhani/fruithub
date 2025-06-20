
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
    const List<String> arabicMonths = [
      'يناير',
      'فبراير',
      'مارس',
      'أبريل',
      'مايو',
      'يونيو',
      'يوليو',
      'أغسطس',
      'سبتمبر',
      'أكتوبر',
      'نوفمبر',
      'ديسمبر',
    ];

    final day = date.day;
    final monthName = arabicMonths[date.month - 1];
    final year = date.year;

    return '$day $monthName , $year';
  }


}
