import 'package:flutter/material.dart';
import 'package:fruithub/core/utils/app_assets.dart';
import 'package:fruithub/feature/onboarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        PageViewItem(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'مرحبًا بك في',
                style: TextStyle(
                  fontSize: 23,
                  color: Color(0xff0C0D0D),
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                ' HUB',
                style: TextStyle(
                  fontSize: 23,
                  color: Color(0xffF4A91F),
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Fruit',
                style: TextStyle(
                  fontSize: 23,
                  color: Color(0xff1B5E37),
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700,
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
          title: Text(
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
