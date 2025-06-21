import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'signout_dialog.dart';

class SignoutButton extends StatelessWidget {
  const SignoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        signoutDialog(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        width: double.infinity,
        height: 56,
        decoration: const BoxDecoration(color: Color(0xffebf9f1)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              "تسجيل الخروج",
              textAlign: TextAlign.center,
              style: AppTextStyles.semiBold13.copyWith(
                color: AppColors.primaryColor,
              ),
            ),

            Positioned(
              left: 50,
              child: SvgPicture.asset(Assets.svgSignout, height: 24, width: 24),
            ),
          ],
        ),
      ),
    );
  }
}
