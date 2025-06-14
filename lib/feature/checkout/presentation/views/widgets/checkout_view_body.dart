import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruithub/core/common/custom_button.dart';
import 'package:fruithub/feature/checkout/domain/entities/order_entity.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/show_snack_bar.dart';
import '../../../../../core/constants/app_const.dart';
import '../../manager/add_order_cubit/add_order_cubit.dart';
import 'checkout_steps.dart';
import 'checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => CheckoutViewBodyState();
}

class CheckoutViewBodyState extends State<CheckoutViewBody> {
  late final PageController pageController;
  final ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );

  int currentStep = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderEntity>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: AppConst.verticalPadding),
          CheckoutSteps(
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
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      _goToNextPage();
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void _handlePaymentSection() {
    context.read<AddOrderCubit>().addOrder(
      orderEntity: context.read<OrderEntity>(),
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: "",
              secretKey: "",
              transactions: const [
                {
                  "amount": {
                    "total": '70',
                    "currency": "USD",
                    "details": {
                      "subtotal": '70',
                      "shipping": '0',
                      "shipping_discount": 0,
                    },
                  },
                  "description": "The payment transaction description.",
                  // "payment_options": {
                  //   "allowed_payment_method":
                  //       "INSTANT_FUNDING_SOURCE"
                  // },
                  "item_list": {
                    "items": [
                      {
                        "name": "Apple",
                        "quantity": 4,
                        "price": '5',
                        "currency": "USD",
                      },
                      {
                        "name": "Pineapple",
                        "quantity": 5,
                        "price": '10',
                        "currency": "USD",
                      },
                    ],

                    // shipping address is not required though
                    //   "shipping_address": {
                    //     "recipient_name": "tharwat",
                    //     "line1": "Alexandria",
                    //     "line2": "",
                    //     "city": "Alexandria",
                    //     "country_code": "EG",
                    //     "postal_code": "21505",
                    //     "phone": "+00000000",
                    //     "state": "Alexandria"
                    //  },
                  },
                },
              ],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                print("onSuccess: $params");
              },
              onError: (error) {
                print("onError: $error");
                Navigator.pop(context);
              },
              onCancel: () {
                print('cancelled:');
              },
            ),
      ),
    );
  }

  void _handleShippingSection(OrderEntity order) {
    if (order.payWithCash == null) {
      ShowSnackBar.showErrorSnackBar(context, 'يرجي تحديد طريقه الدفع');
    } else {
      _goToNextPage();
    }
  }
}
