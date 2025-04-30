import 'package:flutter/material.dart';
import 'package:fruithub/core/utils/app_assets.dart';
import 'package:fruithub/core/utils/app_colors.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';
import 'package:fruithub/feature/onboarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  final PageController pageController;
  const OnBoardingPageView({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isLastPage:
              (pageController.hasClients
                  ? pageController.page!.round() == 0
                  : true),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('مرحبًا بك في', style: AppTextStyles.bold23),
              Text(
                ' HUB',
                style: AppTextStyles.bold23.copyWith(
                  color: const Color(0xffF4A91F),
                ),
              ),
              Text(
                'Fruit',
                style: AppTextStyles.bold23.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          subTitle:
              "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
          backgroundImage: Assets.svgBackground1,
          image: Assets.svgImage1,
        ),
        PageViewItem(
          isLastPage:
              (pageController.hasClients ? pageController.page!.round() : 0) ==
              0,
          title: const Text(
            "ابحث وتسوق",
            style: TextStyle(
              fontSize: 23,
              color: Color(0xff0C0D0D),
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
            ),
          ),
          subTitle:
              "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
          backgroundImage: Assets.svgBackground2,
          image: Assets.svgImage2,
        ),
      ],
    );
  }
}
