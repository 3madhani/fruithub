import 'package:flutter/material.dart';
import 'package:fruithub/feature/auth/presentation/views/login_view.dart';

import '../../feature/auth/presentation/views/sign_up_view.dart';
import '../../feature/onboarding/presentation/views/onboarding_view.dart';
import '../../feature/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (_) => const SignUpView());
    default:
      return MaterialPageRoute(
        builder:
            (_) => const Scaffold(body: Center(child: Text('404 Not Found'))),
      );
  }
}
