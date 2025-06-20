import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../domain/entities/order_entity.dart';

class OrderHeader extends StatelessWidget {
  final bool isTapped;
  final VoidCallback onTap;
  final OrderEntity order;

  const OrderHeader({
    super.key,
    required this.isTapped,
    required this.onTap,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 19, bottom: 19, right: 12, left: 19),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: const ShapeDecoration(
              shape: CircleBorder(),
              color: Color(0xFFebf9f1),
            ),
            child: SvgPicture.asset(Assets.svgBoxOrder),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("طلب رقم: ${order.orderId}", style: AppTextStyles.bold13),
                const SizedBox(height: 4),
                Text(
                  "تم الطلب: ${order.getFormattedDate()}",
                  style: AppTextStyles.regular11.copyWith(
                    color: const Color(0xff949D9E),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "عدد الطلبات : ",
                            style: AppTextStyles.regular13.copyWith(
                              color: const Color(0xff949D9E),
                            ),
                          ),
                          TextSpan(
                            text: "${order.orderProducts.length}",
                            style: AppTextStyles.bold13,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "${order.totalPrice.toStringAsFixed(2)} جنيه",
                      style: AppTextStyles.bold13,
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onTap,
            child: AnimatedRotation(
              duration: const Duration(milliseconds: 200),
              turns: isTapped ? 0.5 : 0.0,
              child: const Icon(Icons.keyboard_arrow_down, size: 24),
            ),
          ),
        ],
      ),
    );
  }
}
