
import '../../../../../core/helper/get_currency_funcion.dart';
import '../../../../home/domain/entities/cart_item_entity.dart';

class Item {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Item({this.name, this.quantity, this.price, this.currency});

  factory Item.fromCartItemEntity(CartItemEntity cartItemEntity) => Item(
    name: cartItemEntity.productEntity.title,
    quantity: cartItemEntity.quantity,
    price: cartItemEntity.productEntity.price.toString(),
    currency: getCurrency(),
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };
}
