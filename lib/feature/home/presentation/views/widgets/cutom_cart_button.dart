import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/common/show_snack_bar.dart';

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
              "الدفع  ${context.watch<CartCubit>().cartEntity.totalPrice.toStringAsFixed(2)} جنيه",
          onPressed: () {
            // Add your payment logic here

            if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
              Navigator.pushNamed(
                context,
                CheckoutView.routeName,
                arguments: context.read<CartCubit>().cartEntity,
              );
            } else {
              ShowSnackBar.showErrorSnackBar(context, 'السلة فارغة');
            }
          },
        );
      },
    );
  }
}
