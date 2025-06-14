import '../order_entity.dart';
import 'amount.dart';
import 'item_list.dart';

class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  factory PaypalPaymentEntity.fromPayPalPaymentEntity(OrderEntity entity) =>
      PaypalPaymentEntity(
        amount: Amount.fromOrderEntity(entity),
        itemList: ItemList.fromCartItems(entity.cartEntity.cartItems),
        description: "PayPal Payment",
      );

  Map<String, dynamic> toJson() => {
    'amount': amount?.toJson(),
    'description': description,
    'item_list': itemList?.toJson(),
  };
}
