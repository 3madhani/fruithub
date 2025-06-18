class OrderProductEntity {
  final String name;
  final String code;
  final int quantity;
  final String imageUrl;
  final double price;

  OrderProductEntity({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

}
