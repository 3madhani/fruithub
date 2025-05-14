import 'package:flutter/material.dart';
import 'package:fruithub/core/common/fruit_item.dart';

import '../../../../../core/constants/app_const.dart';

class BestSellerGridView extends StatelessWidget {
  const BestSellerGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 190,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            right: index % 2 != 0 ? 0 : AppConst.horizontalPadding,
            left: index % 2 == 0 ? 0 : AppConst.horizontalPadding,
          ),

          child: const FruitItem(),
        );
      },
    );
  }
}
