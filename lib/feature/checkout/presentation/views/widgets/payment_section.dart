import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/core/utils/app_assets.dart';
import 'package:fruithub/feature/checkout/presentation/views/widgets/payment_item.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'order_summary_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        const OrderSummaryWidget(),
        const SizedBox(height: 16),
        PaymentItem(
          title: "عنوان التوصيل:",
          child: Row(
            children: [
              SvgPicture.asset(Assets.svgLocation, height: 22, width: 22),
              const SizedBox(width: 8),
              Text(
                "شارع النيل، مبنى رقم ١٢٣",
                style: AppTextStyles.regular14.copyWith(
                  color: const Color(0xff4E5556),
                ),
              ),
              const Spacer(),
              Row(
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
            ],
          ),
        ),
      ],
    );
  }
}
