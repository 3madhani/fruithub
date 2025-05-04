import 'package:flutter/material.dart';
import 'package:fruithub/core/common/custom_button.dart';
import 'package:fruithub/core/common/custom_text_form_field.dart';
import 'package:fruithub/core/common/or_divider_widget.dart';
import 'package:fruithub/core/constants/app_const.dart';
import 'package:fruithub/core/utils/app_colors.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';

import '../../../../../core/common/create_account_text.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConst.horizontalPadding,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CustomTextFormField(
              isPasswordField: false,
              keyboardType: TextInputType.emailAddress,
              hintText: 'البريد الالكتروني',
            ),

            const SizedBox(height: 16),
            const CustomTextFormField(
              isPasswordField: true,
              keyboardType: TextInputType.visiblePassword,
              hintText: 'كلمة المرور',
              suffixIcon: Icon(
                Icons.remove_red_eye,
                size: 24,
                color: Color(0xffC9CECF),
              ),
            ),

            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "نسيت كلمة المرور؟",
                style: AppTextStyles.semiBold13.copyWith(
                  color: AppColors.primaryLightColor,
                ),
              ),
            ),
            const SizedBox(height: 33),

            CustomButton(title: 'تسجيل دخول', onPressed: () {}),
            const SizedBox(height: 33),

            const CreateAccountText(),
            const SizedBox(height: 33),

            const OrDividerWidget(),
          ],
        ),
      ),
    );
  }
}
