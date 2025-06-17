import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../domain/entities/order_input_entity.dart';
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
                  Text(
                    "${context.read<OrderInputEntity>().cartEntity.totalPrice.toStringAsFixed(2)} جنيه",
                    style: AppTextStyles.semiBold16,
                  ),
                  const SizedBox(height: 8),
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

          Row(
            children: [
              const Text("الكلي", style: AppTextStyles.bold16),

              const Spacer(),
              Text(
                "${(context.read<OrderInputEntity>().cartEntity.totalPrice + 30).toStringAsFixed(2)} جنيه",
                style: AppTextStyles.bold16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
