import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/feature/checkout/presentation/views/widgets/step_item.dart';

import '../../../../../core/common/show_snack_bar.dart';
import '../../../domain/entities/order_entity.dart';

List<String> get steps => ['الشحن', 'العنوان', 'الدفع'];

class CheckoutSteps extends StatelessWidget {
  final int currentStep;
  final PageController pageController;

  const CheckoutSteps({
    super.key,
    required this.currentStep,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        steps.length,
        (index) => Expanded(
          child: GestureDetector(
            onTap: () {
              if (context.read<OrderEntity>().payWithCash == null) {
                ShowSnackBar.showErrorSnackBar(
                  context,
                  'يرجي تحديد طريقه الدفع',
                );
              } else {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: StepItem(
              isActive: index <= currentStep,
              stepName: steps[index],
              stepNumber: index + 1,
            ),
          ),
        ),
      ),
    );
  }
}
