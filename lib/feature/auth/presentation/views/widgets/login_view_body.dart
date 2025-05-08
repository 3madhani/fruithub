import 'package:flutter/material.dart';
import 'package:fruithub/core/common/custom_button.dart';
import 'package:fruithub/core/common/custom_text_form_field.dart';
import 'package:fruithub/core/constants/app_const.dart';
import 'package:fruithub/core/utils/app_assets.dart';
import 'package:fruithub/core/utils/app_colors.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';
import 'package:fruithub/feature/auth/presentation/views/sign_up_view.dart';
import 'package:fruithub/feature/auth/presentation/views/widgets/or_divider_widget.dart';
import 'package:fruithub/feature/auth/presentation/views/widgets/social_login_button.dart';

import 'create_account_text.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConst.horizontalPadding,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const CustomTextFormField(
                keyboardType: TextInputType.emailAddress,
                hintText: 'البريد الالكتروني',
              ),

              const SizedBox(height: 16),
              const CustomTextFormField(
                isPasswordField: true,
                keyboardType: TextInputType.visiblePassword,
                hintText: 'كلمة المرور',
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

              CustomPrimaryButton(title: 'تسجيل دخول', onPressed: () {}),
              const SizedBox(height: 33),

              AccountCreationText(
                titleText: 'ليس لديك حساب؟',
                subTitleText: ' قم بانشاء حساب',
                onTap: () {
                  Navigator.pushNamed(context, SignUpView.routeName);
                },
              ),
              const SizedBox(height: 33),

              const OrDividerWidget(),
              const SizedBox(height: 16),
              SocialLoginButton(
                title: 'تسجيل بواسطة جوجل',
                onPressed: () {},
                iconPath: Assets.svgGoogleIcons,
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                title: 'تسجيل بواسطة أبل',
                onPressed: () {},
                iconPath: Assets.svgAppleIcons,
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                title: 'تسجيل بواسطة فيسبوك',
                onPressed: () {},
                iconPath: Assets.svgFacebookIcons,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
