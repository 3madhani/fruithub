import 'package:flutter/material.dart';
import 'package:fruithub/core/utils/app_colors.dart';

import '../utils/app_assets.dart';
import '../utils/app_text_styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: const Color(0xFFF3F5F7),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 24),
                Image.asset(Assets.imagesStrawberryTest, fit: BoxFit.fill),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("فراولة", style: AppTextStyles.bold13),
                          const SizedBox(height: 6),
                          Text.rich(
                            TextSpan(
                              text: "30جنية",
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
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 12),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColors.primaryColor,
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
          ),
        ],
      ),
    );
  }
}
