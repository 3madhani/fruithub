import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/utils/app_colors.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xffEBF9F1)),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          "لديك ${context.watch<CartCubit>().cartEntity.cartItems.length} منتجات في سله التسوق",
          style: AppTextStyles.regular13.copyWith(
            color: AppColors.primaryColor,
            height: .12,
          ),
        ),
      ),
    );
  }
}
