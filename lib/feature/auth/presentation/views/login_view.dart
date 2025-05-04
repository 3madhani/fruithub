import 'package:flutter/material.dart';
import 'package:fruithub/feature/auth/presentation/views/widgets/login_view_body.dart';

import '../../../../core/common/custom_app_bar.dart';

class LoginView extends StatelessWidget {
  static const String routeName = 'login';

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'تسجيل الدخول'),
      body: const LoginViewBody(),
    );
  }
}
