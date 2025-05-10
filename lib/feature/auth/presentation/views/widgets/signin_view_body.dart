import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/common/custom_button.dart';
import 'package:fruithub/core/common/custom_text_form_field.dart';
import 'package:fruithub/core/common/password_form_field.dart';
import 'package:fruithub/core/constants/app_const.dart';
import 'package:fruithub/core/utils/app_assets.dart';
import 'package:fruithub/core/utils/app_colors.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';
import 'package:fruithub/feature/auth/presentation/views/sign_up_view.dart';
import 'package:fruithub/feature/auth/presentation/views/widgets/or_divider_widget.dart';

import '../../cubits/signin_cubit/signin_cubit.dart';
import 'create_account_text.dart';
import 'signin_social_button.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConst.horizontalPadding,
        ),
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidate,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                controller: _emailController,
                onSaved: (value) {
                  _emailController.text = value!;
                },
                keyboardType: TextInputType.emailAddress,
                hintText: 'البريد الالكتروني',
              ),

              const SizedBox(height: 16),
              PasswordFormField(
                controller: _passwordController,
                isSignInField: true,
                onSaved: (value) {
                  _passwordController.text = value!;
                },
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

              CustomPrimaryButton(
                title: 'تسجيل دخول',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context.read<SigninCubit>().signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                  } else {
                    _autoValidate = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
              const SizedBox(height: 33),

              AccountCreationText(
                titleText: 'ليس لديك حساب؟',
                subTitleText: ' قم بانشاء حساب',
                onTap: () {
                  Navigator.pushNamed(context, SignUpView.routeName);
                  _emailController.clear();
                  _passwordController.clear();
                },
              ),
              const SizedBox(height: 33),

              const OrDividerWidget(),
              const SizedBox(height: 16),
              SigninSocialButton(
                title: 'تسجيل بواسطة جوجل',
                onPressed: () {},
                iconPath: Assets.svgGoogleIcons,
              ),
              const SizedBox(height: 16),
              SigninSocialButton(
                title: 'تسجيل بواسطة أبل',
                onPressed: () {},
                iconPath: Assets.svgAppleIcons,
              ),
              const SizedBox(height: 16),
              SigninSocialButton(
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

  @override
  void dispose() {
    // Dispose of the controllers to free up resources
    // This is important to prevent memory leaks
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
