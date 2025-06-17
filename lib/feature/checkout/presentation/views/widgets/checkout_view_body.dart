import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruithub/core/common/custom_button.dart';
import 'package:fruithub/core/common/custom_snackbar_over_button.dart';
import 'package:fruithub/core/utils/app_keys.dart';
import 'package:fruithub/feature/checkout/domain/entities/order_input_entity.dart';
import 'package:fruithub/feature/checkout/domain/entities/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:fruithub/feature/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:fruithub/feature/checkout/presentation/views/widgets/add_order_cubit_bloc_consumer.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/app_const.dart';
import 'checkout_steps.dart';
import 'checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => CheckoutViewBodyState();
}

class CheckoutViewBodyState extends State<CheckoutViewBody> {
  final GlobalKey _buttonKey = GlobalKey();

  late final PageController pageController;
  final ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );

  int currentStep = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderInputEntity>(context, listen: false);

    return AddOrderCubitBlocConsumer(
      buttonKey: _buttonKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: AppConst.verticalPadding),
            CheckoutSteps(
              onStepTapped: (index) {
                if (index == 0) {
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceIn,
                  );
                } else if (index == 1) {
                  if (context.read<OrderInputEntity>().payWithCash == null) {
                    showCustomSnackbarOverButton(
                      context: context,
                      buttonKey: _buttonKey,
                      message: 'يرجي تحديد طريقه الدفع',
                      backgroundColor: Colors.grey,
                    );
                  } else {
                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.bounceIn,
                    );
                  }
                } else {
                  _handleAddressSection();
                }
              },
              pageController: pageController,
              currentStep: currentStep,
            ),
            const SizedBox(height: AppConst.verticalPadding),
            Expanded(
              child: CheckoutStepsPageView(
                valueListenable: valueNotifier,
                formKey: _formKey,
                pageController: pageController,
              ),
            ),
            CustomPrimaryButton(
              key: _buttonKey,
              title: getNextButtonText(currentStep),
              onPressed: () {
                if (currentStep == 0) {
                  _handleShippingSection(order);
                } else if (currentStep == 1) {
                  _handleAddressSection();
                } else {
                  _handlePaymentSection();
                }
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  String getNextButtonText(int step) {
    return switch (step) {
      0 || 1 => "التالي",
      2 => "الدفع بواسطة PayPal",
      _ => "التالي",
    };
  }

  void goToAddressStep() {
    pageController.jumpToPage(1);
    setState(() {
      currentStep = 1;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      if (!mounted || pageController.positions.isEmpty) return;
      final newStep = pageController.page?.round() ?? 0;
      if (newStep != currentStep) {
        setState(() {
          currentStep = newStep;
        });
      }
    });
  }

  void _goToNextPage() {
    pageController.animateToPage(
      currentStep + 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _handleAddressSection() {
    FocusScope.of(context).unfocus(); // 👈 hide the keyboard

    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      _goToNextPage();
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void _handlePaymentSection() {
    var orderEntity = context.read<OrderInputEntity>();
    PaypalPaymentEntity paypalPaymentEntity =
        PaypalPaymentEntity.fromPayPalPaymentEntity(orderEntity);
    var addOrderCubit = context.read<AddOrderCubit>();
    log("onSuccess: ${paypalPaymentEntity.toJson()}");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: AppKeys.paypalClientId,
              secretKey: AppKeys.paypalSecretKey,
              transactions: [paypalPaymentEntity.toJson()],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                log("onSuccess: $params");
                addOrderCubit.addOrder(orderEntity: orderEntity);
                Navigator.pop(context);
              },
              onError: (error) {
                log("onError: $error");
                Navigator.pop(context);
                showCustomSnackbarOverButton(
                  context: context,
                  buttonKey: _buttonKey,
                  message: "فشل عملية الدفع",
                  backgroundColor: Colors.red,
                );
              },
              onCancel: () {
                log("onCancel");
                Navigator.pop(context);
                showCustomSnackbarOverButton(
                  context: context,
                  buttonKey: _buttonKey,
                  message: "تم الغاء عملية الدفع",
                  backgroundColor: Colors.grey,
                );
              },
            ),
      ),
    );
  }

  void _handleShippingSection(OrderInputEntity order) {
    if (order.payWithCash == null) {
      showCustomSnackbarOverButton(
        backgroundColor: Colors.grey,
        buttonKey: _buttonKey,
        context: context,
        message: 'يرجي تحديد طريقه الدفع',
      );
    } else {
      _goToNextPage();
    }
  }
}
