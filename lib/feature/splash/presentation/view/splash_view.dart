import 'package:flutter/material.dart';
import 'package:fruithub/feature/splash/presentation/view/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  static const String routeName = 'splash';

  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashViewBody());
  }
}
