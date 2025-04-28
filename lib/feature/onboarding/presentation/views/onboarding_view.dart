import 'package:flutter/material.dart';
import 'package:fruithub/feature/onboarding/presentation/views/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  static const String routeName = 'onboarding';

  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnboardingViewBody(),
    );
  }
}
