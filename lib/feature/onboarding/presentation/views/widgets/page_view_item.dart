import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';
import 'package:fruithub/feature/auth/presentation/views/signin_view.dart';

import '../../../../../core/constants/app_const.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';

class PageViewItem extends StatelessWidget {
  final String subTitle, backgroundImage, image;
  final Widget title;
  final bool isLastPage;
  const PageViewItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.backgroundImage,
    required this.image,
    required this.isLastPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(image),
              ),
              Visibility(
                visible: isLastPage,
                child: GestureDetector(
                  onTap: () {
                    // Save the onboarding view seen status
                    Prefs.setBool(AppConst.isOnboardingViewSeenKey, true);
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(SignInView.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40, right: 24),
                    child: Text(
                      'تخط',
                      style: AppTextStyles.regular13.copyWith(
                        color: const Color(0xff949D9E),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        title,
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold13.copyWith(
              color: const Color(0xff4E5556),
            ),
          ),
        ),
      ],
    );
  }
}
