import 'package:flutter/material.dart';
import 'package:fruithub/feature/auth/presentation/views/widgets/Sign_in_view_body.dart';

import '../../../../core/common/custom_app_bar.dart';

class SignInView extends StatelessWidget {
  static const String routeName = 'signInView';

  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'تسجيل الدخول'),
      body: const SignInViewBody(),
    );
  }
}
