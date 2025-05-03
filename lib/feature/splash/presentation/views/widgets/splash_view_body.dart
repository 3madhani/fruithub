import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruithub/core/utils/app_assets.dart';
import 'package:fruithub/feature/onboarding/presentation/views/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SvgPicture.asset(Assets.svgPlant)]),
        SvgPicture.asset(Assets.svgLogo),
        SvgPicture.asset(fit: BoxFit.fill, Assets.svgSplashBottom),
      ],
    );
  }

  void excuteNavigation() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }

  @override
  void initState() {
    // Add any initialization logic here if needed
    excuteNavigation();

    super.initState();
  }
}
