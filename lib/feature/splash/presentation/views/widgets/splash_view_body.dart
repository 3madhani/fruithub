import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruithub/core/services/firebase_auth_service.dart';
import 'package:fruithub/core/utils/app_assets.dart';
import 'package:fruithub/feature/onboarding/presentation/views/onboarding_view.dart';

import '../../../../../core/constants/app_const.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';
import '../../../../auth/presentation/views/signin_view.dart';
import '../../../../home/presentation/views/main_view.dart';

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
          children: [SvgPicture.asset(Assets.svgPlant)],
        ),
        SvgPicture.asset(Assets.svgLogo),
        SvgPicture.asset(fit: BoxFit.fill, Assets.svgSplashBottom),
      ],
    );
  }

  void excuteNavigation() {
    // Check if the onboarding view has been seen
    bool isOnboardingViewSeen = Prefs.getBool(AppConst.isOnboardingViewSeenKey);

    // If the onboarding view has been seen, navigate to the login view
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        if (isOnboardingViewSeen) {
          // If the onboarding view has been seen, navigate to the login view
          if (FirebaseAuthService().isLoggedIn()) {
            Navigator.pushReplacementNamed(context, MainView.routeName);
          } else {
            Navigator.pushReplacementNamed(context, SignInView.routeName);
          }
        } else {
          // If the onboarding view has not been seen, navigate to the onboarding view
          // Save the onboarding view seen status
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        }
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
