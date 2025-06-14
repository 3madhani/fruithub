import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../domain/entities/order_entity.dart';
import 'checkout_view_body.dart';
import 'payment_item.dart';

class AddressSummary extends StatelessWidget {
  const AddressSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: "عنوان التوصيل:",
      child: Row(
        children: [
          SvgPicture.asset(Assets.svgLocation, height: 22, width: 22),
          const SizedBox(width: 8),
          Text(
            context.read<OrderEntity>().shippingAddress.getAddress(),
            style: AppTextStyles.regular14.copyWith(
              color: const Color(0xff4E5556),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              final bodyState =
                  context.findAncestorStateOfType<CheckoutViewBodyState>();
              bodyState?.goToAddressStep();
            },
            child: Row(
              children: [
                SvgPicture.asset(Assets.svgVector, height: 16, width: 16),
                const SizedBox(width: 4),
                Text(
                  "تعديل",
                  style: AppTextStyles.semiBold13.copyWith(
                    color: const Color(0xff949D9E),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
