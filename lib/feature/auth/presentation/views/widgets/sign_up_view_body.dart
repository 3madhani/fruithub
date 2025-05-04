import 'package:flutter/material.dart';
import 'package:fruithub/core/common/custom_button.dart';
import 'package:fruithub/core/common/custom_text_form_field.dart';
import 'package:fruithub/core/constants/app_const.dart';
import 'package:fruithub/feature/auth/presentation/views/widgets/create_account_text.dart';

import 'terms_and_conditions.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConst.horizontalPadding,
        ),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CustomTextFormField(
              hintText: 'الاسم كامل',
              keyboardType: TextInputType.name,
              isPasswordField: false,
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              hintText: 'البريد الالكتروني',
              keyboardType: TextInputType.emailAddress,
              isPasswordField: false,
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              hintText: "كلمة المرور",
              keyboardType: TextInputType.visiblePassword,
              isPasswordField: true,
              suffixIcon: Padding(
                padding: EdgeInsets.only(left: 26.0),
                child: Icon(
                  Icons.remove_red_eye,
                  size: 24,
                  color: Color(0xffC9CECF),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const TermsAndConditions(),
            const SizedBox(height: 30),
            CustomPrimaryButton(title: 'إنشاء حساب جديد', onPressed: () {}),
            const SizedBox(height: 26),
            AccountCreationText(
              titleText: "تمتلك حساب بالفعل؟",
              subTitleText: " تسجيل دخول",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
