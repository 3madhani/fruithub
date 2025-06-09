import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'payment_item.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: "ملخص الطلب :",
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "المجموع الفرعي :",
                    style: AppTextStyles.regular13.copyWith(
                      color: const Color(0xFF4E5556),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "التوصيل  :",
                    style: AppTextStyles.regular13.copyWith(
                      color: const Color(0xFF4E5556),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("150 جنيه", style: AppTextStyles.semiBold16),
                  Text(
                    "30جنية",
                    style: AppTextStyles.semiBold13.copyWith(
                      color: const Color(0xFF4E5556),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 9),
          const Divider(
            endIndent: 33,
            indent: 33,
            color: Color(0xFFCACECE),
            thickness: .5,
          ),
          const SizedBox(height: 9),

          const Row(
            children: [
              Text("الكلي", style: AppTextStyles.bold16),

              Spacer(),
              Text("180 جنيه", style: AppTextStyles.bold16),
            ],
          ),
        ],
      ),
    );
  }
}
