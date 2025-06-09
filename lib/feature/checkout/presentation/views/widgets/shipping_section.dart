import 'package:flutter/material.dart';

import 'shipping_item.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 33),
        ShippingItem(
          shippingMethod: "الدفع عند الاستلام",
          shippingCost: "40",
          deliveryMethod: "التسليم من المكان",
        ),
        SizedBox(height: 10),
        ShippingItem(
          shippingMethod: "الدفع اونلاين",
          shippingCost: "10",
          deliveryMethod: "يرجي تحديد طريقه الدفع",
        ),
      ],
    );
  }
}
