import 'package:flutter/material.dart';
import 'package:fruithub/core/common/custom_app_bar.dart';

import 'widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  static const String routeName = 'signUpView';

  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "حساب جديد", context: context),
      body: const SignUpViewBody(),
    );
  }
}
