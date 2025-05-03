import 'package:flutter/material.dart';
import 'package:fruithub/feature/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  static const String routeName = 'login';

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoginViewBody());
  }
}
