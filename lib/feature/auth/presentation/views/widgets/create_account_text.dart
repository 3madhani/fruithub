import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruithub/core/utils/app_colors.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';

class AccountCreationText extends StatelessWidget {
  final String titleText;
  final String subTitleText;
  final void Function() onTap;
  const AccountCreationText({
    super.key,
    required this.titleText,
    required this.subTitleText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: titleText,
        style: AppTextStyles.semiBold16.copyWith(
          color: const Color(0xff949D9E),
        ),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: subTitleText,
            style: AppTextStyles.semiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
