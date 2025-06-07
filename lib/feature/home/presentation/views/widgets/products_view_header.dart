import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruithub/core/utils/app_assets.dart';

import '../../../../../core/utils/app_text_styles.dart';

class ProductsViewHeader extends StatelessWidget {
  final int productsNumber;

  const ProductsViewHeader({super.key, required this.productsNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$productsNumber نتائج",
          textAlign: TextAlign.right,
          style: AppTextStyles.bold16,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 44,
            height: 31,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xffeaebeb), width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: SvgPicture.asset(Assets.svgArrowSwapHorizontal),
          ),
        ),
      ],
    );
  }
}
