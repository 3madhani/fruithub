import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 158,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      child: Stack(
        children: [
          Image.asset(Assets.imagesStrawberryTest, fit: BoxFit.fill),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesStrawberryTest),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Text(
                  "عروض العيد",
                  style: AppTextStyles.regular13.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  "خصم 25%",
                  style: AppTextStyles.bold19.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                 FeaturedItemButton(
                  onPressed: () {
                    
                  },
                 ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
