import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/feature/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';

import '../../../../../core/constants/app_const.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../domain/entities/cart_item_entity.dart';
import 'cart_action_button.dart';

class CartItemActionButtons extends StatelessWidget {
  final CartItemEntity cartItemEntity;

  const CartItemActionButtons({super.key, required this.cartItemEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartActionButton(
          icon: Icons.add,
          color: AppColors.primaryColor,
          onPressed: () {
            cartItemEntity.increaseQuantity();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          }, // Add your onPressed logic here
          iconColor: Colors.white,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConst.horizontalPadding,
          ),
          child: Text(
            "${cartItemEntity.quantity}",
            style: AppTextStyles.bold16,
            textAlign: TextAlign.center,
          ),
        ),

        CartActionButton(
          icon: Icons.remove,
          color: const Color(0xffF3F5F7),
          onPressed: () {
            cartItemEntity.decreaseQuantity();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          }, // Add your onPressed logic here
          iconColor: const Color(0xff979899),
        ),
      ],
    );
  }
}
