import 'package:flutter/material.dart';
import 'package:fruithub/feature/splash/presentation/view/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (_) => const SplashView(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('404 Not Found'),
          ),
        ),
      );
  }
}