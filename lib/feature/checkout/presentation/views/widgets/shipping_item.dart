import 'package:flutter/material.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';

class ShippingItem extends StatelessWidget {
  final String shippingMethod;

  final String deliveryMethod;
  final String shippingCost;
  const ShippingItem({
    super.key,
    required this.shippingMethod,
    required this.deliveryMethod,
    required this.shippingCost,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.only(top: 16, bottom: 16, left: 13, right: 28),
      decoration: const ShapeDecoration(
        color: Color(0x33D9D9D9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: const ShapeDecoration(
                shape: OvalBorder(
                  side: BorderSide(color: Color(0xff949D9E), width: 1),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(shippingMethod, style: AppTextStyles.semiBold13),
                const SizedBox(height: 6),
                Text(
                  deliveryMethod,
                  style: AppTextStyles.regular13.copyWith(
                    color: const Color(0x50000000),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: Text(
                "$shippingCost جنيه",
                style: AppTextStyles.bold13.copyWith(
                  color: const Color(0xff3A8B33),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
