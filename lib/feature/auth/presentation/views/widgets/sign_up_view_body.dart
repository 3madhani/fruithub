import 'package:flutter/material.dart';
import 'package:fruithub/core/common/custom_text_form_field.dart';
import 'package:fruithub/core/constants/app_const.dart';

import 'terms_and_conditions.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConst.horizontalPadding),
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomTextFormField(
              hintText: 'الاسم كامل',
              keyboardType: TextInputType.name,
              isPasswordField: false,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'البريد الالكتروني',
              keyboardType: TextInputType.emailAddress,
              isPasswordField: false,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
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
            SizedBox(height: 16),
            TermsAndConditions(),
          ],
        ),
      ),
    );
  }
}
