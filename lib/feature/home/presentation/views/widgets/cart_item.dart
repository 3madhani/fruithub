import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruithub/core/common/build_snack_bar.dart';
import 'package:fruithub/core/utils/app_colors.dart';
import 'package:fruithub/feature/home/domain/entities/cart_item_entity.dart';
import 'package:fruithub/feature/home/presentation/views/widgets/cart_item_action_buttons.dart';

import '../../../../../core/common/custom_network_image.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';

class CartItem extends StatelessWidget {
  final CartItemEntity cartItemEntity;

  const CartItem({super.key, required this.cartItemEntity});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Example: 73 is approx 19% of a 375px screen width
    final containerWidth = screenWidth * 0.19;
    final containerHeight = containerWidth * 1.26; // keep 73:92 ratio

    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: containerWidth,
            height: containerHeight,
            decoration: const BoxDecoration(color: Color(0xffF3F5F7)),
            child: CustomNetworkImage(
              imageUrl: cartItemEntity.productEntity.imageUrl!,
            ),
          ),
          const SizedBox(width: 17),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      cartItemEntity.productEntity.title,
                      style: AppTextStyles.bold13,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().removeCartItem(
                          cartItemEntity,
                        );
                        
                      },
                      child: SvgPicture.asset(Assets.svgTrash),
                    ),
                  ],
                ),
                Text(
                  "${cartItemEntity.totalWeight} كم",
                  style: AppTextStyles.regular13.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CartItemActionButtons(),
                    Text(
                      "${cartItemEntity.totalPrice} جنيه ",
                      style: AppTextStyles.bold16.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
