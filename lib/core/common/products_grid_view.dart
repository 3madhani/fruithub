import 'package:flutter/material.dart';
import 'package:fruithub/core/common/fruit_item.dart';
import 'package:fruithub/core/entities/product_entity.dart';

import '../constants/app_const.dart';

class ProductsGridView extends StatelessWidget {
  final List<ProductEntity> products;
  const ProductsGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 195,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            right: index % 2 != 0 ? 0 : AppConst.horizontalPadding,
            left: index % 2 == 0 ? 0 : AppConst.horizontalPadding,
          ),

          child: FruitItem(product: products[index]),
        );
      },
    );
  }
}
