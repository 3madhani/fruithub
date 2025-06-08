import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/custom_button.dart';
import '../../../../checkout/presentation/views/checkout_view.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';
import '../../cubits/cart_item_cubit/cart_item_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomPrimaryButton(
          title:
              "الدفع  ${context.read<CartCubit>().cartEntity.totalPrice.toStringAsFixed(2)} جنيه",
          onPressed: () {
            // Add your payment logic here
            Navigator.pushNamed(context, CheckoutView.routeName);
          },
        );
      },
    );
  }
}
