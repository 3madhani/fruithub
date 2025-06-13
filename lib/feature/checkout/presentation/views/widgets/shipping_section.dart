import 'package:flutter/material.dart';

import 'shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 33),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
          isSelected: selectedIndex == 0,
          shippingMethod: "الدفع عند الاستلام",
          shippingCost: "40",
          deliveryMethod: "التسليم من المكان",
        ),
        const SizedBox(height: 16),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
          isSelected: selectedIndex == 1,
          shippingMethod: "الدفع اونلاين",
          shippingCost: "10",
          deliveryMethod: "يرجي تحديد طريقه الدفع",
        ),
      ],
    );
  }
}
