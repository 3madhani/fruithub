import 'package:flutter/material.dart';
import 'package:fruithub/feature/splash/presentation/view/splash_view.dart';

import 'core/helper/on_generate_routes.dart';

void main() {
  runApp(const Fruithub());
}

class Fruithub extends StatelessWidget {
  const Fruithub({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}