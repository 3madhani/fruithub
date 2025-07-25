import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/feature/home/presentation/cubits/cart_cubit/cart_cubit.dart';

import '../entities/product_entity.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'custom_network_image.dart';
import 'favorite_button.dart';

class FruitItem extends StatelessWidget {
  final ProductEntity product;

  const FruitItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: const Color(0xFFF3F5F7),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 24),
              product.imageUrl == null
                  ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    height: 120,
                    width: double.infinity,
                    color: Colors.grey[300],
                  )
                  : CustomNetworkImage(imageUrl: product.imageUrl!),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.title, style: AppTextStyles.bold13),
                        const SizedBox(height: 6),
                        Text.rich(
                          TextSpan(
                            text: "${product.price}جنية",
                            style: AppTextStyles.bold13.copyWith(
                              color: AppColors.secondaryColor,
                            ),
                            children: [
                              TextSpan(
                                text: " / الكيلو",
                                style: AppTextStyles.semiBold13.copyWith(
                                  color: AppColors.secondaryLightColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().addProduct(product);
                          },
                          child: const CircleAvatar(
                            radius: 18,
                            backgroundColor: AppColors.primaryColor,
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: FavoriteButton(product: product),
          ),
        ],
      ),
    );
  }
}
