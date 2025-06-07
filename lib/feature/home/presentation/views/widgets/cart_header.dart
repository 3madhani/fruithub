import 'package:flutter/material.dart';
import 'package:fruithub/core/utils/app_colors.dart';

import '../../../../../core/utils/app_text_styles.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xffEBF9F1)),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          "لديك 3 منتجات في سله التسوق",
          style: AppTextStyles.regular13.copyWith(
            color: AppColors.primaryColor,
            height: .12,
          ),
        ),
      ),
    );
  }
}
