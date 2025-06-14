import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_const.dart';
import 'address_input_section.dart';
import 'payment_section.dart';
import 'shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
    required this.formKey,
    required this.valueListenable,
  });

  List<Widget> get pages => [
    const ShippingSection(),
    AddressInputSection(formKey: formKey, valueListenable: valueListenable),
    const PaymentSection(),
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
