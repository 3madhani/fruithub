import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruithub/core/common/custom_button.dart';
import 'package:fruithub/core/constants/app_const.dart';
import 'package:fruithub/core/services/shared_preferences_singleton.dart';
import 'package:fruithub/core/utils/app_colors.dart';
import 'package:fruithub/feature/onboarding/presentation/views/widgets/on_boarding_page_view.dart';

import '../../../../auth/presentation/views/login_view.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView(pageController: _pageController)),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            activeSize: const Size(11, 11),
            color:
                _currentPage == 1
                    ? AppColors.primaryColor
                    : AppColors.primaryColor.withOpacity(0.5),
            size: _currentPage == 1 ? const Size(11, 11) : const Size(9, 9),
          ),
        ),
        const SizedBox(height: 29),
        Visibility(
          maintainAnimation: true,
          maintainState: true,
          maintainSize: true,
          visible: _currentPage == 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConst.horizontalPadding,
            ),
            child: CustomButton(
              title: 'ابدأ الان',
              onPressed: () {
                // Save the onboarding view seen status
                Prefs.setBool(
                  AppConst.isOnboardingViewSeenKey,
                  true,
                );
                // Navigate to the next screen
                Navigator.of(context).pushReplacementNamed(LoginView.routeName);
              },
            ),
          ),
        ),
        const SizedBox(height: 43),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }
}
