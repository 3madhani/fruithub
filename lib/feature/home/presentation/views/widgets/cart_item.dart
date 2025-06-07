import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/common/custom_network_image.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_text_styles.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

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
            child: const CustomNetworkImage(imageUrl: ''),
          ),
          const SizedBox(width: 17),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Text("بطيخ", style: AppTextStyles.bold13),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(Assets.svgTrash),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
