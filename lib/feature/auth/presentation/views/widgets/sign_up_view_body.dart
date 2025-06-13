import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/common/show_snack_bar.dart';
import 'package:fruithub/core/common/custom_button.dart';
import 'package:fruithub/core/common/custom_text_form_field.dart';
import 'package:fruithub/core/constants/app_const.dart';
import 'package:fruithub/feature/auth/presentation/views/widgets/create_account_text.dart';

import '../../../../../core/common/password_form_field.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';
import 'terms_and_conditions.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  late bool isTermdAndConditionsAccepted = false;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConst.horizontalPadding,
        ),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                controller: _nameController,
                onSaved: (value) {
                  _nameController.text = value!;
                },
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.name,
                isPasswordField: false,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: _emailController,
                onSaved: (value) {
                  _emailController.text = value!;
                },
                hintText: 'البريد الالكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordFormField(
                controller: _passwordController,
                isSignInField: false,
                onSaved: (value) {
                  _passwordController.text = value!;
                },
              ),
              const SizedBox(height: 16),
              TermsAndConditions(
                onChanged: (value) {
                  isTermdAndConditionsAccepted = value;
                },
              ),
              const SizedBox(height: 30),
              CustomPrimaryButton(
                title: 'إنشاء حساب جديد',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Call the signup function from the cubit or bloc here
                    if (isTermdAndConditionsAccepted) {
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                            name: _nameController.text,
                          );
                    } else {
                      ShowSnackBar.showErrorSnackBar(
                        context,
                        'يرجى قبول الشروط والاحكام',
                      );
                    }
                  } else {
                    setState(() {
                      _autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
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
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}
