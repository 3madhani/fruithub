import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/common/custom_button.dart';
import 'package:fruithub/feature/checkout/domain/entities/order_entity.dart';

import '../../../../../core/common/show_snack_bar.dart';
import '../../../../../core/constants/app_const.dart';
import 'checkout_steps.dart';
import 'checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;

  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: AppConst.verticalPadding),
          CheckoutSteps(
            pageController: pageController,
            currentStep: currentStep,
          ),
          const SizedBox(height: AppConst.verticalPadding),
          Expanded(
            child: CheckoutStepsPageView(pageController: pageController),
          ),
          CustomPrimaryButton(
            title: getNextButtonText(currentStep),
            onPressed: () {
              // Handle next button action
              if (context.read<OrderEntity>().payWithCash == null) {
                ShowSnackBar.showErrorSnackBar(
                  context,
                  'يرجي تحديد طريقه الدفع',
                );
              } else {
                pageController.animateToPage(
                  currentStep + 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
          const SizedBox(height: 120),
        ],
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  String getNextButtonText(int currentStep) {
    switch (currentStep) {
      case 0:
        return "التالي";
      case 1:
        return "التالي";
      case 2:
        return "الدفع بواسطة PayPal";
      default:
        return "التالي";
    }
  }

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentStep = pageController.page!.toInt();
      });
    });
    super.initState();
  }
}
