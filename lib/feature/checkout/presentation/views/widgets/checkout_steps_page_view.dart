import 'package:flutter/material.dart';

import '../../../../../core/constants/app_const.dart';
import 'shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  final PageController pageController;

  const CheckoutStepsPageView({super.key, required this.pageController});

  List<Widget> get pages => const [
    ShippingSection(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppConst.verticalPadding),
      child: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
    );
  }
}
