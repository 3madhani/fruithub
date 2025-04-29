import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruithub/core/common/custom_button.dart';
import 'package:fruithub/core/constants/app_sizes.dart';
import 'package:fruithub/core/utils/app_colors.dart';
import 'package:fruithub/feature/onboarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: OnBoardingPageView()),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            activeSize: const Size(11, 11),
            color: AppColors.primaryColor.withOpacity(0.5),
            size: const Size(9, 9),
          ),
        ),
        const SizedBox(height: 29),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.horizontalPadding,
          ),
          child: CustomButton(
            title: 'ابدأ الان',
            onPressed: () {
              // Navigate to the next screen
            },
          ),
        ),
        const SizedBox(height: 43),
      ],
    );
  }
}
