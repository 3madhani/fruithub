import 'package:flutter/material.dart';
import 'package:fruithub/feature/home/domain/entities/cart_item_entity.dart';

import '../../../../../core/constants/app_const.dart';
import 'cart_item.dart';
import 'custom_divider.dart';

class CartItemsList extends StatelessWidget {
  final List<CartItemEntity> cartItems;

  const CartItemsList({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const CustomDivider(),
      itemCount: cartItems.length,
      itemBuilder:
          (context, index) => Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConst.horizontalPadding,
            ),

            child: CartItem(cartItemEntity: cartItems[index]),
          ),
    );
  }
}
