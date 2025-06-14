import '../../../../home/domain/entities/cart_item_entity.dart';
import 'item.dart';

class ItemList {
  List<Item>? items;

  ItemList({this.items});

  factory ItemList.fromCartItems(List<CartItemEntity> cartItems) => ItemList(items: cartItems.map((e) => Item.fromCartItemEntity(e)).toList());

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
