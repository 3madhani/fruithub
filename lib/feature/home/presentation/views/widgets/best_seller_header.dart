import 'package:flutter/material.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';

import '../../../../best_selling_fruits/presentation/views/best_selling_view.dart';

class BestSellerHeader extends StatelessWidget {
  const BestSellerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "الأكثر مبيعًا",
          textAlign: TextAlign.right,
          style: AppTextStyles.bold16,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, BestSellingView.routeName);
          },
          child: Text(
            "المزيد",
            textAlign: TextAlign.center,
            style: AppTextStyles.regular13.copyWith(
              color: const Color(0xff949D9E),
            ),
          ),
        ),
      ],
    );
  }
}
