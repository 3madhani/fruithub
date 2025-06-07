import 'package:flutter/material.dart';
import 'package:fruithub/core/utils/app_colors.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';

import '../../../../../core/constants/app_const.dart';
import 'cart_action_button.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CartActionButton(
          icon: Icons.add,
          color: AppColors.primaryColor,
          onPressed: null, // Add your onPressed logic here
          iconColor: Colors.white,
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConst.horizontalPadding),
          child: Text("3", style: AppTextStyles.bold16),
        ),

        CartActionButton(
          icon: Icons.remove,
          color: Color(0xffF3F5F7),
          onPressed: null, // Add your onPressed logic here
          iconColor: Color(0xff979899),
        ),
      ],
    );
  }
}
