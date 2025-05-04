import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruithub/core/utils/app_colors.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';
import 'package:fruithub/feature/auth/presentation/views/sign_up_view.dart';

class CreateAccountText extends StatelessWidget {
  const CreateAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'لا تمتلك حساب؟',
        style: AppTextStyles.semiBold16.copyWith(
          color: const Color(0xff949D9E),
        ),
        children: [
          TextSpan(
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, SignUpView.routeName);
                  },
            text: ' قم بانشاء حساب',
            style: AppTextStyles.semiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
