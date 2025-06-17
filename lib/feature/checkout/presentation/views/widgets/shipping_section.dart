import 'package:flutter/material.dart';
import 'package:fruithub/feature/checkout/domain/entities/order_input_entity.dart';
import 'package:provider/provider.dart';

import 'shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = -1;
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var orderEntity = context.read<OrderInputEntity>();
    return Column(
      children: [
        const SizedBox(height: 33),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 0;
              orderEntity.payWithCash = true;
            });
          },
          isSelected: selectedIndex == 0,
          shippingMethod: "الدفع عند الاستلام",
          shippingCost: (orderEntity.cartEntity.totalPrice + 30)
              .toStringAsFixed(2),
          deliveryMethod: "التسليم من المكان",
        ),
        const SizedBox(height: 16),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 1;
              orderEntity.payWithCash = false;
            });
          },
          isSelected: selectedIndex == 1,
          shippingMethod: "الدفع اونلاين",
          shippingCost: orderEntity.cartEntity.totalPrice.toString(),
          deliveryMethod: "يرجي تحديد طريقه الدفع",
        ),
      ],
    );
  }
}
